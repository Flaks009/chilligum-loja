# frozen_string_literal: true

class AddImageToProdutos < ActiveRecord::Migration[5.0]
  def change
    add_column :produtos, :image, :string
  end
end
