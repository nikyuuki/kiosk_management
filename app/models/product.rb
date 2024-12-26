class Product < ApplicationRecord
    belongs_to :category_product
    has_many :combo_products, dependent: :destroy
    has_many :combos, through: :combo_products

    validates :name, presence: true
    validates :priceperpack, numericality: { greater_than_or_equal_to: 0 }
end
