require "test_helper"

class SaveVehicleUseCaseTest < ActiveSupport::TestCase
    test "returns the saved vehicle" do
        identifier = "HA-3452"
        mock_data = {
            "id" => 1,
            "identifier" => identifier
        }

        VehicleRepository.stub(:find_or_create, mock_data) do
            result = SaveVehicleUseCase.execute(identifier)

            assert_equal mock_data, result
            assert_equal identifier, result["identifier"]
        end
    end
end
