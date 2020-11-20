require 'bcrypt'

class Trainer < ApplicationRecord
    has_many :training_sessions
    has_many :clients, through: :training_sessions

    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, presence: true

    has_secure_password

    # Upcoming Training Sessions 

    # Training Sessions Left This Month
end
