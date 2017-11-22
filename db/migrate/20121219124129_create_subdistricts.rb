class CreateSubdistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_subdistricts do |t|
      t.string     :name
      t.string     :abbr
      t.references :city
    end
  end
end
