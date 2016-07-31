class Addsupplierid < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :supplier, :integer
  end
end
