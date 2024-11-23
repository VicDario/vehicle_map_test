class SaveVehicleUseCase
    def self.execute(vehicle_identifier)
        unless SaveVehicleUseCase.valid_identifier?(vehicle_identifier)
            raise ArgumentError, "Invalid vehicle identifier"
        end
        VehicleRepository.find_or_create(vehicle_identifier)
    end

    private

    def self.valid_identifier?(vehicle_identifier)
        vehicle_identifier.is_a?(String) && vehicle_identifier.length > 3 && vehicle_identifier.length < 10
      end
end
