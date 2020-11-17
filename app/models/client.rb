class Client < ApplicationRecord
    has_many :training_sessions
    has_many :trainers, through: :training_sessions
end
