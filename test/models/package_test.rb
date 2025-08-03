require "test_helper"

class PackageTest < ActiveSupport::TestCase
  setup do
    @package = packages(:one)
    @plan = plans(:one)
    @package_no_signature = packages(:no_signature)
  end

  test "is invalid without a plan and package" do
    package = Package.new(name: "No Plan", plan_id: nil, additional_service_ids: [additional_services(:one)].map(&:id))

    assert_not package.valid?
    assert_includes package.errors[:plan], "must exist"
  end

  test "calculates price before save if price is not given" do
    package = Package.new(name: "Calculated Price", plan: @plan, additional_services: [additional_services(:one)])

    assert package.save!
    assert_equal 19.98, package.price
  end
end
