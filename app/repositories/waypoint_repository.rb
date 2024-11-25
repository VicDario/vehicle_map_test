class WaypointRepository
    def self.create_waypoint(params, vehicle)
        Waypoint.create!(latitude: params[:latitude], longitude: params[:longitude], sent_at: params[:sent_at], vehicle: vehicle)
    end

    def self.get_latest_waypoint_of_each_vehicle
        waypoints = Waypoint.select("DISTINCT ON (vehicle_id) vehicle_id as vehicle_identifier, longitude, latitude, sent_at")
                .order(:vehicle_id, created_at: :desc)
        waypoints.map do |waypoint|
            waypoint.attributes.except("id")
        end
    end
end
