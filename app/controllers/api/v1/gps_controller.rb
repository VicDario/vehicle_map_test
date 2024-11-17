class Api::V1::GpsController < ApplicationController
    def create
        vehicle = Vehicle.find_or_create_by(identifier: gps_params[:vehicle_identifier])

        waypoint = vehicle.waypoints.create!(
            latitude: gps_params[:latitude],
            longitude: gps_params[:longitude],
            sent_at: gps_params[:sent_at]
        )

        render json: waypoint, status: :created
    end

    private
    def gps_params
        params.permit(:latitude, :longitude, :vehicle_identifier, :sent_at)
    end
end
