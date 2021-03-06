class CreateTrendingProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_trending_products do |t|
      t.string :name
      t.string :link_url
      t.boolean :published
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end
end
