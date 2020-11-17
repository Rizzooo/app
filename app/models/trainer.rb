require 'bcrypt'

class Trainer < ApplicationRecord
    has_many :training_sessions
    has_many :clients, through: :training_sessions

    # validates :email, presence: true, uniqueness: true

    has_secure_password
end
