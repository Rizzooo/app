class Client < ApplicationRecord
    has_many :training_sessions
    has_many :trainers, through: :training_sessions

    # Upcoming Training Sessions
    def upcoming 
    end

    # Training Sessions Left This Month
    def training_sessions_remaining_this_month
    end

    # Notes From Client's Training Sessions
    def notes_from_training
    end
end
