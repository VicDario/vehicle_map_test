class VehicleRepository
    def self.find_or_create(vehicle_identifier)
        Vehicle.find_or_create_by(identifier: vehicle_identifier)
    end
end
