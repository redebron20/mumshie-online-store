class User < ApplicationRecord
    class User < ApplicationRecord
        has_secure_password

        has_many :orders
        has_many :products, through: :orders

        validates :email, presence: true, uniqueness: true
        validates :username, presence: true, uniqueness: true

        enum role: %i(customer admin)
    
    end
end
