class Product < ApplicationRecord
    belongs_to :category
    has_many :order_items
    has_many :orders, through: :order_items

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    
    scope :search_by_name, -> (search) {where("name LIKE ?", "#{search}%")}
    scope :latest_products, -> {order(created_at: :desc)}

    def category_attributes=(attributes)
        if !attributes["name"].blank?
            self.category = Category.find_or_create_by(attributes)
        end
    end
end
