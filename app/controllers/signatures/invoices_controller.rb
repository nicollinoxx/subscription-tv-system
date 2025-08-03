class Signatures::InvoicesController < ApplicationController
  before_action :set_signature

  def index
    @package_bills = @signature.package&.bills
    @plan_bills = @signature.plan&.bills
    @additional_services = @signature.additional_services
  end

  private

    def set_signature
      @signature = Signature.find(params[:signature_id])
    end
end
