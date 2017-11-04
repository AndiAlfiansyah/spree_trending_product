class Spree::TrendingProduct < ActiveRecord::Base

  has_attached_file :image,
                    url: '/spree/trending_products/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/trending_products/:id/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  scope :published, -> { where(published: true).order('position ASC') }
  belongs_to :product

  def initialize(attrs = nil)
    attrs ||= { published: true }
    super
  end

  def trending_product_name
    name.blank? && product.present? ? product.name : name
  end

  def trending_product_link
    link_url.blank? && product.present? ? product : link_url
  end

  def trending_product_image
    !image.file? && product.present? && product.images.any? ? product.images.first.attachment : image
  end

  def self.get_by_position(position)
    puts self.inspect
    self.find do  |o|
      puts o.inspect
      o.position == position
    end
  end

end
