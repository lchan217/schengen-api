class Trip < ApplicationRecord
    belongs_to :user
    validates :entry, presence: true
    validates :exit, presence: true
    validates :location, presence: true

    def assign_passed(trip)
        trip.exit+1 > Date.current() ? trip.passed = 1 : trip.passed = 0
    end
end
