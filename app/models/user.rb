class User < ApplicationRecord
    class User < ApplicationRecord
        has_secure_password

        has_many :orders
        has_many :quantities
        has_many :products, through: :quantities

        validates :email, presence: true, uniqueness: true
    
    end
end
