class AddSubdistrictsIdToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_addresses, :subdistrict_id, :integer
  end
end
