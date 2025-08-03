require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "Customer should not be valid if he is under eighteen" do
    customer = Customer.new(name: "test", age: 3)
    assert_not customer.valid?
  end

  test "Customer should be valid if he is over eighteen years old or older" do
    customer = Customer.new(name: "test", age: 18)
    assert customer.valid?

    customer = Customer.new(name: "test", age: 21)
    assert customer.valid?
  end

  test "Customer should not be valid when age is not present" do
    customer = Customer.new(name: "test", age: nil)
    assert_not customer.valid?
  end

  test "Customer should not be valid when age is not integer" do
    customer = Customer.new(name: "test", age: 18.9)
    assert_not customer.valid?
  end

  test "Customer should be valid if name is present" do
    customer = Customer.new(name: "test", age: 18)
    assert customer.valid?
  end

  test "Customer should not be valid if name is not present" do
    customer = Customer.new(name: "", age: 18)
    assert_not customer.valid?
  end
end
