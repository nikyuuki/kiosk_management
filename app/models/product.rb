class Product < ApplicationRecord
    belongs_to :category_product

    
    validates :name, presence: true
    validates :priceperpack, numericality: { greater_than_or_equal_to: 0 }
end
