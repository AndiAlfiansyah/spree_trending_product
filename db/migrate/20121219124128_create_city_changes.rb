class CreateCityChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_city_changes do |t|
      t.string     :name
      t.string     :previous_city
      t.references :cityful
      t.references :user
      t.string     :cityful_type
      t.string     :next_city
      t.timestamps null: false
    end
  end
end
