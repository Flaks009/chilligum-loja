class AddPrecoToProdutos < ActiveRecord::Migration[5.0]
  def change
    change_column :produtos, :preco, :float, precision: 5, scale: 2
  end
end
