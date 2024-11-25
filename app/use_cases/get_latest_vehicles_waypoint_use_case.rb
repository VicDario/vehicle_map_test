class GetLatestVehiclesWaypointUseCase
    def self.execute
        WaypointRepository.get_latest_waypoint_of_each_vehicle()
    end
end
