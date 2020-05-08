class User < ApplicationRecord
    has_secure_password
    has_many :trips
    validates :email, uniqueness: { case_sensitive: false }, presence: true
    validates :password, presence: true
end
