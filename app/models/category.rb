class Category < ApplicationRecord
    has_many :products

    validates :name, presence: true, uniqueness: true

    scope :alpha, -> {order('name')}
    scope :popular_category, -> {joins(:products).group("products.category_id").order("count(products.category_id) DESC").limit(1)}

end
