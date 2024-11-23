class SaveWaypointUseCase
    def self.execute(params, vehicle)
        unless valid_latitude?(params[:latitude]) && valid_longitude?(params[:longitude])
            raise ArgumentError, "Invalid latitude or longitude values"
        end
        WaypointRepository.create_waypoint(params, vehicle)
    end

    private

    def self.valid_latitude?(latitude)
        latitude.is_a?(Numeric) && latitude >= -90 && latitude <= 90
    end

    def self.valid_longitude?(longitude)
        longitude.is_a?(Numeric) && longitude >= -180 && longitude <= 180
    end
end
