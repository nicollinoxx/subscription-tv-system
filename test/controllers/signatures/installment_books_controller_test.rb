require "test_helper"

class Signatures::InstallmentBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @signature = signatures(:one)
  end

  test "should get index" do
    get signature_installment_book_url(@signature)
    assert_response :success
  end
end
