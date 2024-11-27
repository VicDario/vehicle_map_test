class WaypointRepository
    def self.create_waypoint(params, vehicle)
        Waypoint.create!(latitude: params[:latitude], longitude: params[:longitude], sent_at: params[:sent_at], vehicle: vehicle)
    end

    def self.get_latest_waypoint_of_each_vehicle
        waypoints = Waypoint.select("DISTINCT ON (vehicle_id) vehicle_id, waypoints.longitude, waypoints.latitude, waypoints.sent_at, vehicles.identifier as vehicle_identifier")
                .joins("INNER JOIN vehicles ON vehicles.id = waypoints.vehicle_id")
                .order(:vehicle_id, created_at: :desc)
        waypoints.map do |waypoint|
            waypoint.attributes.except("id")
        end
    end
end
