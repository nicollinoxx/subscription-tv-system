class Signatures::BillsController < ApplicationController
  before_action :set_signature

  def index
    @packages_bills = @signature.package.bills if @signature.package.present?
    @plan_bills = @signature.plan.bills if @signature.plan.present?

    @additional_services = @signature.additional_services
  end

  private

    def set_signature
      @signature = Signature.find(params[:signature_id])
    end
end
