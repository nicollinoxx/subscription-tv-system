require "application_system_test_case"

class AdditionalServicesTest < ApplicationSystemTestCase
  setup do
    @additional_service = additional_services(:one)
  end

  test "visiting the index" do
    visit additional_services_url
    assert_selector "h1", text: "Additional services"
  end

  test "should create additional service" do
    visit additional_services_url
    click_on "New additional service"

    fill_in "Name", with: @additional_service.name
    fill_in "Price", with: @additional_service.price
    click_on "Create Additional service"

    assert_text "Additional service was successfully created"
    click_on "Back"
  end

  test "should update Additional service" do
    visit additional_service_url(@additional_service)
    click_on "Edit this additional service", match: :first

    fill_in "Name", with: @additional_service.name
    fill_in "Price", with: @additional_service.price
    click_on "Update Additional service"

    assert_text "Additional service was successfully updated"
    click_on "Back"
  end

  test "should destroy Additional service" do
    visit additional_service_url(@additional_service)
    accept_confirm { click_on "Destroy this additional service", match: :first }

    assert_text "Additional service was successfully destroyed"
  end
end
