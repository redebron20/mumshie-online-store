class Product < ApplicationRecord
    belongs_to :category
    has_many :orders 
    has_many :users, through: :orders

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%")}

    def category_attributes=(attributes)
        if !attributes["name"].blank?
            self.category = Brand.find_or_create_by(attributes)
        end
    end
end
