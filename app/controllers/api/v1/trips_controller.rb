class Api::V1::TripsController < ApplicationController
    def index
        if logged_in?
            @trips = current_user.trips
            render json: @trips, status: 201
        end
    end
end
