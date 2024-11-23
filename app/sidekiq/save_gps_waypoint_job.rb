class SaveGpsWaypointJob
    include Sidekiq::Job

    def perform(params)
        Rails.logger.info("Waypoint queue")
        begin
            vehicle = SaveVehicleUseCase.execute(params[:vehicle_identifier])
            SaveWaypointUseCase.execute(params, vehicle)

            Rails.logger.info("Waypoint saved successfully for vehicle #{params[:vehicle_identifier]}")
        rescue ArgumentError => e
            Rails.logger.error("Failed to save waypoint: #{e.message}")
        end
    end
end
