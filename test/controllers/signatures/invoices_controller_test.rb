require "test_helper"

class Signatures::InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @signature = signatures(:one)
  end

  test "should get index" do
    get signature_invoices_url(@signature)
    assert_response :success
  end
end
