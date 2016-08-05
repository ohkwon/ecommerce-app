class CreateProductConsoles < ActiveRecord::Migration[5.0]
  def change
    create_table :product_consoles do |t|
      t.integer :product_id
      t.integer :console_id

      t.timestamps
    end
  end
end
