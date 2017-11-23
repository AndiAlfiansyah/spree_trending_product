class Spree::City < ActiveRecord::Base
  belongs_to :state, class_name: 'Spree::State'
  has_many :subdistricts, dependent: :destroy, class_name: 'Spree::Subdistrict'
  has_many :address, dependent: :restrict_with_error
  validates :state, :name, presence: true
  validates :name, :abbr, uniqueness: { case_sensitive: false }, allow_blank: true

  def self.find_all_by_name_or_abbr(name_or_abbr)
    where('name = ? OR abbr = ?', name_or_abbr, name_or_abbr)
  end

  # table of { country.id => [ state.id , state.name ] }, arrays sorted by name
  # blank is added elsewhere, if needed
  def self.cities_group_by_id
    city_info = Hash.new { |h, k| h[k] = [] }
    order(:name).each do |city|
      city_info[city.state_id.to_s].push [city.id, city.name]
    end
    city_info
  end

  def <=>(other)
    name <=> other.name
  end

  def to_s
    name
  end
end

