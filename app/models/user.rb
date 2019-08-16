# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  validates :name, presence: true
  has_many :produtos, dependent: :delete_all
  validates_numericality_of :tel, message: 'deve ser um número'
  validates_length_of :tel, minimum: 10, maximum: 11, message: 'Insira um telefone válido'
end
