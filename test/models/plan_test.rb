require "test_helper"

class PlanTest < ActiveSupport::TestCase
  setup do
     @plan = plans(:one)
     @package = packages(:one)
     @signature = signatures(:one)
     @bill = bills(:one)
  end

  test "should not destroy plan if it has signatures or packages" do
    assert_no_difference 'Plan.count' do
      assert_not @plan.destroy
      assert_includes @plan.errors[:base], "This Plan is linked to packages or signatures."
    end
  end

  test "should destroy plan if no linked packages or signatures" do
    assert_difference("Plan.count", -1) do
      assert plans(:no_packages_and_signatures).destroy
    end
  end

  test "Plan should be valid if name is present" do
    plan = Plan.new(name: "teste", price: 18)
    assert plan.valid?
  end

  test "Plan should not be valid if name is not present" do
    plan = Plan.new(name: "", price: 18)
    assert_not plan.valid?
  end

  test "Plan should be valid if price is present" do
    plan = Plan.new(name: "test", price: 18)
    assert plan.valid?
  end

  test "Plan should not be valid if price is present" do
    plan = Plan.new(name: "test", price: nil)
    assert_not plan.valid?
  end
end
