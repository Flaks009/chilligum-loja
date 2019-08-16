# frozen_string_literal: true

class AddTextToProduto < ActiveRecord::Migration[5.0]
  def change
    change_column :produtos, :desc, :text
  end
end
