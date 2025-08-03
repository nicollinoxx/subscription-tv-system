require "application_system_test_case"

class SignaturesTest < ApplicationSystemTestCase
  setup do
    @signature = signatures(:one)
    @customer = customers(:one)
    @plan = plans(:one)
    @package = packages(:one)
  end

  test "visiting the index" do
    visit signatures_url
    assert_selector "h1", text: "Signatures"
  end

  test "should create signature" do
    visit signatures_url
    click_on "New signature"

    select @customer.name, from: 'signature[customer_id]'
    select @plan.name, from: 'signature[plan_id]'

    click_on "Create Signature"

    assert_text "Signature was successfully created"
    click_on "Back"
  end

  test "should destroy Signature" do
    visit signature_url(@signature)
    accept_confirm { click_on "Destroy this signature", match: :first }

    assert_text "Signature was successfully destroyed"
  end
end
