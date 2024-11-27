require "test_helper"

class SaveWaypointUseCaseTest < ActiveSupport::TestCase
    test "raises error for invalid latitude" do
        invalid_params = { latitude: 100, longitude: 50, sent_at: "2024-11-27 12:00:00" }
        vehicle = vehicles(:one)

        assert_raises(ArgumentError, "Invalid latitude or longitude values") do
            SaveWaypointUseCase.execute(invalid_params, vehicle)
        end
    end

    test "raises error for invalid longitude" do
        invalid_params = { latitude: 50, longitude: 200, sent_at: "2024-11-27 12:00:00" }
        vehicle = vehicles(:one)

        assert_raises(ArgumentError, "Invalid latitude or longitude values") do
            SaveWaypointUseCase.execute(invalid_params, vehicle)
        end
    end

    test "calls the repository with valid params" do
        latitude = -70.64827
        longitude = -33.45694
        valid_params = { latitude: latitude, longitude: longitude, sent_at: "2024-11-27 12:00:00" }
        expected = { "latitude" => latitude, "longitude" => longitude, "sent_at" => "2024-11-27 12:00:00" }

        vehicle = vehicles(:one)

        WaypointRepository.stub(:create_waypoint, expected) do
            result = SaveWaypointUseCase.execute(valid_params, vehicle)
            assert_equal latitude, result["latitude"]
            assert_equal longitude, result["longitude"]
        end
    end
end
