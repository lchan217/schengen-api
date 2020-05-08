class Api::V1::TripsController < ApplicationController
    def index
        @trips = current_user.trips
        render json: @trips, status: 201
    end

    def trip_params
        params.require(:trip).permit(:entry, :exit, :location, :passed, :user_id)
    end
end
