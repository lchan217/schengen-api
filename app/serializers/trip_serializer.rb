class TripSerializer < ActiveModel::Serializer
  attributes :id, :entry, :exit, :location, :passed
end
