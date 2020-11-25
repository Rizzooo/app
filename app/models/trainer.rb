require 'bcrypt'
require 'active_support/time'

class Trainer < ApplicationRecord
    has_many :training_sessions
    has_many :clients, through: :training_sessions

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_secure_password

    TRAINERS = Trainer.all
    # Upcoming Training Sessions
    def self.upcoming_sessions
        TrainingSession.all.where(trainer_id: current_trainer.id)
    end

    # Training Sessions Left This Month
    def self.sessions_left_this_month
        TrainingSession.all.where(trainer_id: current_trainer.id, end_time: end_of_month)
    end
end
