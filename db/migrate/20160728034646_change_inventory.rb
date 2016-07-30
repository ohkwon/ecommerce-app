class ChangeInventory < ActiveRecord::Migration[5.0]
  def change

    change_column :products, :inventory, "boolean USING inventory::boolean", default: true
  end
end
