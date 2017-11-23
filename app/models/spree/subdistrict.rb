class Spree::Subdistrict < ActiveRecord::Base
  belongs_to :city, class_name: 'Spree::City'
  has_many :address, dependent: :restrict_with_error
  validates :city, :name, presence: true
  validates :name, :abbr, uniqueness: { case_sensitive: false, scope: :city_id }, allow_blank: true

  def self.find_all_by_name_or_abbr(name_or_abbr)
    where('name = ? OR abbr = ?', name_or_abbr, name_or_abbr)
  end

  # table of { country.id => [ state.id , state.name ] }, arrays sorted by name
  # blank is added elsewhere, if needed
  def self.subdistrict_group_by_id
    subdistrict_info = Hash.new { |h, k| h[k] = [] }
    order(:name).each do |subdistrict|
      subdistrict_info[subdistrict.city_id.to_s].push [subdistrict.id, subdistrict.name]
    end
    subdistrict_info
  end

  def <=>(other)
    name <=> other.name
  end

  def to_s
    name
  end
end

