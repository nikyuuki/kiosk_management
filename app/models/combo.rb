class Combo < ApplicationRecord
    has_many :combo_products, dependent: :destroy
    has_many :products, through: :combo_products
  
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end