class AddCitiesIdToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_addresses, :city_id, :integer
  end
end
