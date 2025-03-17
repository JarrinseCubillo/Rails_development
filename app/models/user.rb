class User < ApplicationRecord
    validates :email, presence: true
    validates :password, length: { minimum: 5 }
    validates :password_confirmation, length: { minimum: 5 }
    has_secure_password
    has_many :articles
end
