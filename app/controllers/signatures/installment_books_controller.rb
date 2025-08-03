class Signatures::InstallmentBooksController < ApplicationController
  before_action :set_signature

  def show
    @installment_book = @signature.installment_book
  end

  private

    def set_signature
      @signature = Signature.find(params[:signature_id])
    end
end
