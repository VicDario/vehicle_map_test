class Api::V1::GpsController < ApplicationController
    def create
        SaveGpsWaypointJob.perform_async(gps_params.to_json)
        render json: { message: "Waypoint creation in progress" }, status: :accepted
    end

    private
    def gps_params
        params.permit(:latitude, :longitude, :vehicle_identifier, :sent_at)
    end
end
