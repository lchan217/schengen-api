class Api::V1::TripsController < ApplicationController
    def index
        @trips = current_user.trips
        render json: @trips, status: 201
    end
end
