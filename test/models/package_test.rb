require "test_helper"

class PackageTest < ActiveSupport::TestCase
  setup do
    @package = packages(:one)
    @plan = plans(:one)
    @package_no_signature = packages(:no_signature)
  end

  test "should not destroy package if it has signatures" do
    assert_no_difference 'Package.count' do
      assert_not @package.destroy
      assert_includes @package.errors[:base], "This Package is linked to packages or signatures."
    end
  end

  test "should destroy package if no linked signatures" do
    assert_difference("Package.count", -1) do
      assert @package_no_signature.destroy
    end
  end

  test "validates presence of name" do
    package = Package.new(price: 10, plan: @plan)
    assert_not package.valid?
    assert_includes package.errors[:name], "can't be blank"
  end

  test "validates presence of at least one additional service" do
    package = Package.new(name: "Test Package", price: 10, plan: @plan)
    assert_not package.valid?
    assert_includes package.errors[:base], "Package must have at least one additional service."
  end

  test "is valid with name, plan and at least one additional service" do
    package = Package.new(name: "Combo", plan: @plan, additional_services: [additional_services(:one)])

    assert package.valid?
  end

  test "is invalid without a name" do
    package = Package.new(name: "", plan: @plan, additional_services: [additional_services(:one)])

    assert_not package.valid?
    assert_includes package.errors[:name], "can't be blank"
  end

  test "is invalid without a plan and package" do
    package = Package.new(name: "No Plan", plan_id: nil, additional_service_ids: [additional_services(:one)].map(&:id))

    assert_not package.valid?
    assert_includes package.errors[:plan], "must exist"
  end

  test "is invalid if no additional services are added" do
    package = Package.new(name: "No Services", plan: @plan)

    assert_not package.valid?
    assert_includes package.errors[:base], "Package must have at least one additional service."
  end

  test "is invalid if price is negative" do
    package = Package.new(name: "Invalid Price", price: -5, plan: @plan, additional_services: [additional_services(:one)])

    assert_not package.valid?
    assert_includes package.errors[:price], "must be greater than or equal to 0"
  end

  test "calculates price before save if price is not given" do
    package = Package.new(name: "Calculated Price", plan: @plan, additional_services: [additional_services(:one)])

    assert package.save!
    assert_equal 19.98, package.price
  end
end
