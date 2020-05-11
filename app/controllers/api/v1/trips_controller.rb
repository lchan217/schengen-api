class Api::V1::TripsController < ApplicationController
    def index
        trips = current_user.trips
        past = trips.select {|trip| trip.passed == true}
        future = trips.select {|trip| trip.passed == false}
        render json: {past: past, future: future}, status: 201
    end

    def create 
        trip = Trip.new(trip_params)
        trip.update(user_id: current_user.id)
        trip.assign_attrs(trip)
        byebug
    end 

    def trip_params
        params.require(:trip).permit(:entry, :exit, :location, :passed, :user_id)
    end
end
