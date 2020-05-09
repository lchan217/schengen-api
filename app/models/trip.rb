class Trip < ApplicationRecord
    belongs_to :user
    validates :entry, presence: true
    validates :exit, presence: true
    validates :location, presence: true
end
