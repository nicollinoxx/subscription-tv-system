require "test_helper"

class SignatureTest < ActiveSupport::TestCase
  setup do
    @customer = customers(:one)
    @plan = plans(:one)
    @package = packages(:one)
    @additional_service1 = additional_services(:one)
    @additional_service2 = additional_services(:two)
    @additional_service3 = additional_services(:three)
  end

  test "should create 12 bills for package and additional services" do
    signature = Signature.create!(customer: @customer, package: @package, additional_services: [@additional_service3])

    assert_equal 12, signature.bills.where(billable: @package).count
    assert_equal 12, signature.bills.where(billable: @additional_service3).count
  end

  test "should create 12 invoices with correct total price" do
    signature = Signature.create!(customer: @customer, package: @package, additional_services: [@additional_service3])

    assert_equal 12, signature.invoices.count

    expected_price = @package.price + @additional_service3.price
    assert_equal expected_price, signature.invoices.first.price
  end

  test "should create installment_book with correct total price" do
    signature = Signature.create!(
      customer: @customer,
      package: @package,
      additional_services: [@additional_service3]
    )

    assert signature.installment_book.present?
    total_invoice_price = signature.invoices.first.price * 12
    assert_equal total_invoice_price, signature.installment_book.price
  end

  test "should be valid with plan and no package" do
    signature = Signature.new(customer: @customer, plan: @plan, additional_services: [@additional_service1])
    assert signature.valid?
  end

  test "should be valid with package and no plan" do
    signature = Signature.new(customer: @customer, package: @package)
    assert signature.valid?, signature.errors.full_messages.join(", ")
  end

  test "should be valid if additional_services do not repeat those in package" do
    signature = Signature.new(customer: @customer, package: @package, additional_services: [@additional_service3])
    assert signature.valid?, signature.errors.full_messages.join(", ")
  end

  test "should be invalid with both plan and package" do
    signature = Signature.new(customer: @customer, plan: @plan, package: @package, additional_services: [@additional_service1])
    assert_not signature.valid?
    assert_includes signature.errors[:base], "Must have either a package or a plan, not both"
  end

  test "should be invalid with neither plan or package" do
    signature = Signature.new(customer: @customer, additional_services: [@additional_service1])
    assert_not signature.valid?
    assert_includes signature.errors[:base], "Must have either a package or a plan, not both"
  end

  test "should be invalid if additional_services repeat those in package" do
    signature = Signature.new(customer: @customer, package: @package, additional_services: [@additional_service1, @additional_service2])
    assert_not signature.valid?
    assert_includes signature.errors[:base], "The chosen additional services are already in the package"
  end
end
