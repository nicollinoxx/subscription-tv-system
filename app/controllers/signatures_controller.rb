class SignaturesController < ApplicationController
  before_action :set_signature, only: %i[ show edit update destroy ]

  # GET /signatures
  def index
    @signatures = Signature.all
  end

  # GET /signatures/1
  def show
  end

  # GET /signatures/new
  def new
    @signature = Signature.new
  end

  # GET /signatures/1/edit
  def edit
  end

  # POST /signatures
  def create
    @signature = Signature.new(signature_params)

    if @signature.save
      redirect_to @signature, notice: "Signature was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /signatures/1
  def update
    if @signature.update(signature_params)
      redirect_to @signature, notice: "Signature was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /signatures/1
  def destroy
    @signature.destroy!
    redirect_to signatures_path, notice: "Signature was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature
      @signature = Signature.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def signature_params
      params.expect(signature: [ :customer_id, :plan_id, :package_id, additional_service_ids: [] ])
    end
end
