class Order < ApplicationRecord
    has_many :products, through: :quantities
end
