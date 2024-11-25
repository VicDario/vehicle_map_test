class Api::V1::GpsController < ApplicationController
    def create
        SaveGpsWaypointJob.perform_async(gps_params.to_json)
        render json: { message: "Waypoint creation in progress" }, status: :accepted
    end

    def latest_waypoint_of_each_vehicle
        waypoints = GetLatestVehiclesWaypointUseCase.execute()
        render json: waypoints, status: :ok
    end

    private
    def gps_params
        params.permit(:latitude, :longitude, :vehicle_identifier, :sent_at)
    end
end
