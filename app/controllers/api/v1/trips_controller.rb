class Api::V1::TripsController < ApplicationController
    def index
        trips = current_user.trips
        Trip.date_check(trips)
        past = trips.select {|trip| trip.passed == true}
        future = trips.select {|trip| trip.passed == false}
        active = trips.select {|trip| trip.entry > Date.current() - 181}
        render json: {past: past, future: future, active: active}, status: 201
    end

    def create 
        trip = Trip.new(trip_params)
        trip.update(user_id: current_user.id)
        if trip.valid? 
            trip.assign_attrs(trip)
            render json: { message: trip }, status: :created
        else 
            render json: { error: trip.errors.full_messages }, status: :not_acceptable
        end
    end 

    def trip_params
        params.require(:trip).permit(:entry, :exit, :location, :passed, :user_id)
    end
end
