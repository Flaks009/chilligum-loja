# frozen_string_literal: true

class Produto < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_save { nome.upcase! }
  belongs_to :user
  validates_numericality_of :preco, message: 'Insira um preco valido'
  validates_length_of :nome, minimum: 2, message: 'Insira um nome com no minimo 2 letras'
end
