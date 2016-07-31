class Suppliernamechange < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :supplier, :supplier_id
  end
end
