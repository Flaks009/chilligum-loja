class AddUserToProdutos < ActiveRecord::Migration[5.0]
  def change
    add_reference :produtos, :user, foreign_key: true
  end
end
