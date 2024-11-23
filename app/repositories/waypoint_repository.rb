class WaypointRepository
    def self.create_waypoint(params, vehicle)
      Waypoint.create!(latitude: params[:latitude], longitude: params[:longitude], sent_at: params[:sent_at], vehicle: vehicle)
    end
end
