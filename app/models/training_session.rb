require 'active_support/time'

class TrainingSession < ApplicationRecord
    belongs_to :client
    belongs_to :trainer

    after_initialize :set_current_time, :set_default_end_time
    validate :overlapping

    private # Move helpers to /helpers/trainers_helper.rb

    def set_current_time
        current_time = Time.zone.now.strftime("%B %e at %I:%M %p")
        self.start_time = current_time
    end

    def set_default_end_time
        current_time = Time.zone.now
        default_end_time = (current_time + 30.minutes).to_datetime.strftime("%B %e at %I:%M %p")
        self.end_time = default_end_time
        # byebug
    end

    private
    def overlapping
        if TrainingSession.where('? <  start_time and ? > end_time', self.start_time, self.end_time).any?
            flash[:notice] = "Time not available."
            redirect_to new_training_session_path
        end
    end

end
