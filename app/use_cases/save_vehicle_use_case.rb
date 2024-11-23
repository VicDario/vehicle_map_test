class SaveVehicleUseCase
    def self.execute(vehicle_identifier)
        VehicleRepository.find_or_create(vehicle_identifier)
    end
end
