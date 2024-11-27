require "test_helper"

class VehicleRepositoryTest < ActiveSupport::TestCase
  test "keep number of existing vehicles and return vehicle" do
    vehicle_identifier = "LI-9443"
    result = VehicleRepository.find_or_create(vehicle_identifier)

    assert_equal vehicle_identifier, result.identifier
    assert_equal 2, Vehicle.count, "No new record should be created"
  end

  test "creates and returns a new vehicle if it does not exist" do
    vehicle_identifier = "XYZ-5678"
    result = VehicleRepository.find_or_create(vehicle_identifier)

    assert_equal vehicle_identifier, result.identifier
    assert_equal 3, Vehicle.count, "No record was created"
  end
end
