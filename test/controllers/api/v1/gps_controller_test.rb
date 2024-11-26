require "test_helper"
require "minitest/mock"
require "sidekiq/testing"

class Api::V1::GpsControllerTest < ActionDispatch::IntegrationTest
    test "should enqueue SaveGpsWaypointJob and respond with accepted status" do
        Sidekiq::Testing.fake!
        post "/api/v1/gps", params: {
            latitude: 40.7128,
            longitude: -74.0060,
            vehicle_identifier: "vehicle_123",
            sent_at: "2024-11-26 12:34:56Z"
        }

        assert_response :accepted
        json_response = JSON.parse(response.body)
        assert_equal "Waypoint creation in progress", json_response["message"]
        assert_equal 1, SaveGpsWaypointJob.jobs.size
    end

    test "should return latest waypoints for vehicles" do
        mock_waypoints = [
          { vehicle_identifier: "vehicle_123", latitude: "40.7128", longitude: "-74.0060", sent_at: "2024-11-26T12:34:56Z" },
          { vehicle_identifier: "vehicle_456", latitude: "34.0522", longitude: "-118.2437", sent_at: "2024-11-26T14:34:56Z" }
        ]

        GetLatestVehiclesWaypointUseCase.stub(:execute, mock_waypoints) do
            get "/api/v1/gps/latest"
            assert_response :ok

            json_response = JSON.parse(response.body)
            assert_equal 2, json_response.length
            assert_equal "vehicle_123", json_response.first["vehicle_identifier"]
            end
    end
end
