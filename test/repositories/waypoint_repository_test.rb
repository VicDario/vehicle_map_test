require "test_helper"

class WaypointRepositoryTest < ActiveSupport::TestCase
    setup do
        @vehicle_one = vehicles(:one)
        @vehicle_two = vehicles(:two)
    end

    test "creates a waypoint associated with a vehicle" do
        params = { latitude: -33.42734, longitude: -70.64327, sent_at: "2023-11-20 12:00:00" }
        before_count = Waypoint.count

        waypoint = WaypointRepository.create_waypoint(params, @vehicle_one)

        assert_equal params[:latitude], waypoint.latitude
        assert_equal params[:longitude], waypoint.longitude
        assert_equal params[:sent_at].to_datetime, waypoint.sent_at
        assert_equal @vehicle_one.id, waypoint.vehicle_id
        assert before_count < Waypoint.count
    end

    test "fetches the latest waypoint for each vehicle" do
        waypoint_one = waypoints(:one)
        waypoint_two = waypoints(:two)

        latest_waypoints = WaypointRepository.get_latest_waypoint_of_each_vehicle

        vehicle_one_waypoint = latest_waypoints.find { |w| w["vehicle_identifier"] == @vehicle_one.identifier }
        vehicle_two_waypoint = latest_waypoints.find { |w| w["vehicle_identifier"] == @vehicle_two.identifier }

        assert_equal 2, latest_waypoints.size
        assert_equal waypoint_one.latitude, vehicle_one_waypoint["latitude"]
        assert_equal waypoint_one.longitude, vehicle_one_waypoint["longitude"]
        assert_equal waypoint_two.latitude, vehicle_two_waypoint["latitude"]
        assert_equal waypoint_two.longitude, vehicle_two_waypoint["longitude"]
    end
end
