class Product < ApplicationRecord
    belongs_to :category
    has_many :quantities
    has_many :users, through: :quantities

    validates :name, presence: true
    validates :price, presence: true
end
