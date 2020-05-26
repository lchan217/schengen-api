class Trip < ApplicationRecord
    belongs_to :user
    validates :entry, presence: true
    validates :exit, presence: true
    validates :location, presence: true
    validate :exit_cannot_be_before_entry, :schengen_countries

    def assign_attrs(trip)
        trip.exit+1 > Date.current() ? trip.passed = 0 : trip.passed = 1
        trip.time_passed = (trip.exit+1 - trip.entry).to_i
        trip.save
    end

    def schengen_countries
        countries = ["Austria", "Belgium", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Iceland", "Italy", "Latvia", "Liechtenstein", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Norway", "Poland", "Portugal", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland"]
        errors.add(:location, "must be in the Schengen Area") if !countries.include?(location)
    end 

    def exit_cannot_be_before_entry
        errors.add(:exit, "Date of exit cannot be before date of entry") if exit < entry 
    end

    def self.date_check(trips)
        trips.each do |trip| 
            trip.exit+1 > Date.current() ? trip.passed = 0 : trip.passed = 1
            trip.save
        end 
    end
end
