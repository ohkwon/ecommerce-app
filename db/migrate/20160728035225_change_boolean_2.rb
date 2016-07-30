class ChangeBoolean2 < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :inventory, 'boolean USING CAST(inventory AS boolean)'
  end
end
