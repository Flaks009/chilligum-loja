class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.float :preco
      t.string :desc

      t.timestamps
    end
  end
end
