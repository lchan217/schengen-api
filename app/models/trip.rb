class Trip < ApplicationRecord
    belongs_to :user
    validates :entry, presence: true
    validates :exit, presence: true
    validates :location, presence: true
    validate :exit_cannot_be_before_entry

    def assign_attrs(trip)
        trip.exit+1 > Date.current() ? trip.passed = 0 : trip.passed = 1
        trip.time_passed = (trip.exit+1 - trip.entry).to_i
    end

    def exit_cannot_be_before_entry
        if exit && exit+1 < entry 
            errors.add(:exit, "Date of exit cannot be before date of entry")
        end
    end
end
