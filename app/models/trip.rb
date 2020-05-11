class Trip < ApplicationRecord
    belongs_to :user
    validates :entry, presence: true
    validates :exit, presence: true
    validates :location, presence: true

    def assign_attrs(trip)
        trip.exit+1 > Date.current() ? trip.passed = 0 : trip.passed = 1
        trip.time_passed = (trip.exit - trip.entry).to_i
    end
end
