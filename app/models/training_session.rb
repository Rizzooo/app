require 'active_support/time'

class TrainingSession < ApplicationRecord
    belongs_to :client
    belongs_to :trainer

    after_initialize :set_current_time, :set_default_end_time, :set_trainer
    
    # Pretty time (Start/end time)
    def pretty_time(time)
    end

    private # Move helpers to /helpers/trainers_helper.rb

    def set_current_time
        current_time = Time.zone.now.to_datetime
        self.start_time = current_time
    end

    def set_default_end_time
        default_end_time = (Time.zone.now + 30.minutes).to_datetime
        self.end_time = default_end_time
        # byebug
    end

    def set_trainer
        self.trainer_id = current_trainer
    end
end
