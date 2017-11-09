class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_cities do |t|
      t.string     :name
      t.string     :abbr
      t.references :state
    end
  end
end
