require "test_helper"

class AdditionalServiceTest < ActiveSupport::TestCase
  setup do
    @additional_service = additional_services(:one)
    @package = packages(:one)
    @signature = signatures(:one)
    @bill = bills(:one)
  end

  test "should not destroy additional_service if it has signatures or packages" do
    assert_no_difference 'AdditionalService.count' do
      assert_not @additional_service.destroy
      assert_includes @additional_service.errors[:base], "This AdditionalService is linked to packages or signatures."
    end
  end

  test "should destroy additional_service if no linked packages or signatures" do
    assert_difference("AdditionalService.count", -1) do
      assert additional_services(:no_packages_and_signatures).destroy
    end
  end

  test "AdditionalService should be valid if name and price are present" do
    additional_service = AdditionalService.new(name: "Teste", price: 18)
    assert additional_service.valid?
  end

  test "AdditionalService should not be valid without a name" do
    additional_service = AdditionalService.new(name: "", price: 18)
    assert_not additional_service.valid?
  end

  test "AdditionalService should be valid with a price" do
    additional_service = AdditionalService.new(name: "Teste", price: 18)
    assert additional_service.valid?
  end

  test "AdditionalService should not be valid without a price" do
    additional_service = AdditionalService.new(name: "Teste", price: nil)
    assert_not additional_service.valid?
  end
end
