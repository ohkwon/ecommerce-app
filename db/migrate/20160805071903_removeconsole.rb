class Removeconsole < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :console, :string
  end
end
