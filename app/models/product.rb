class Product < ApplicationRecord
    belongs_to :category
    has_many :orders 
    has_many :users, through: :orders

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%")}
end
