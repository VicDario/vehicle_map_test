require "json"

class SaveGpsWaypointJob
    include Sidekiq::Job

    def perform(params)
        Rails.logger.info("Waypoint queue")
        begin
            waypoint_params = JSON.parse(params, symbolize_names: true)
            vehicle = SaveVehicleUseCase.execute(waypoint_params[:vehicle_identifier])
            SaveWaypointUseCase.execute(waypoint_params, vehicle)

            Rails.logger.info("Waypoint saved successfully for vehicle #{waypoint_params[:vehicle_identifier]}")
        rescue ArgumentError => e
            Rails.logger.error("Failed to save waypoint: #{e.message}")
        end
    end
end
