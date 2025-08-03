class SignaturesController < ApplicationController
  before_action :set_signature, only: %i[ show destroy ]

  def index
    @signatures = Signature.all
  end

  def show
  end

  def new
    @signature = Signature.new
  end

  def create
    @signature = Signature.new(signature_params)

    if @signature.save
      redirect_to @signature, notice: "Signature was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @signature.destroy!
    redirect_to signatures_path, notice: "Signature was successfully destroyed.", status: :see_other
  end

  private

    def set_signature
      @signature = Signature.find(params.expect(:id))
    end

    def signature_params
      params.expect(signature: [ :customer_id, :plan_id, :package_id, additional_service_ids: [] ])
    end
end
