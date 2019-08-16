# frozen_string_literal: true

class AddNewFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tel, :string
  end
end
