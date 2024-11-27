require "test_helper"

class GetLatestVehiclesWaypointUseCaseTest < ActiveSupport::TestCase
    test "returns the latest waypoint for each vehicle" do
        mock_data = [
        {
            "vehicle_id" => 1,
            "longitude" => -70.64827,
            "latitude" => -33.45694,
            "sent_at" => "2024-11-26 12:00:00",
            "vehicle_identifier" => "HA-3452"
        },
        {
            "vehicle_id" => 2,
            "longitude" => -70.65000,
            "latitude" => -33.45000,
            "sent_at" => "2024-11-26 13:00:00",
            "vehicle_identifier" => "HA-1234"
        }
        ]

        WaypointRepository.stub(:get_latest_waypoint_of_each_vehicle, mock_data) do
        result = GetLatestVehiclesWaypointUseCase.execute

        assert_equal mock_data, result
        assert_equal 2, result.size
        end
    end
end
