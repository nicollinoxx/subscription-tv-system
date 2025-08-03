require "test_helper"

class PackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package = packages(:one)
    @plan = plans(:one)
    @additional_services = [additional_services(:one), additional_services(:two)]
  end

  test "should get index" do
    get packages_url
    assert_response :success
  end

  test "should get new" do
    get new_package_url
    assert_response :success
  end

  test "should create package" do
    assert_difference("Package.count") do
      post packages_url, params: { package: { name: @package.name, price: @package.price, plan_id: @plan.id, additional_service_ids: @additional_services.map(&:id) } }
    end

    assert_redirected_to package_url(Package.last)
  end

  test "should show package" do
    get package_url(@package)
    assert_response :success
  end

  test "should get edit" do
    get edit_package_url(@package)
    assert_response :success
  end

  test "should update package" do
    patch package_url(@package), params: { package: { name: @package.name, price: @package.price } }
    assert_redirected_to package_url(@package)
  end
end
