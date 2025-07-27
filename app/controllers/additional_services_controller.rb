class AdditionalServicesController < ApplicationController
  before_action :set_additional_service, only: %i[ show edit update destroy ]

  # GET /additional_services
  def index
    @additional_services = AdditionalService.all
  end

  # GET /additional_services/1
  def show
  end

  # GET /additional_services/new
  def new
    @additional_service = AdditionalService.new
  end

  # GET /additional_services/1/edit
  def edit
  end

  # POST /additional_services
  def create
    @additional_service = AdditionalService.new(additional_service_params)

    if @additional_service.save
      redirect_to @additional_service, notice: "Additional service was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /additional_services/1
  def update
    if @additional_service.update(additional_service_params)
      redirect_to @additional_service, notice: "Additional service was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /additional_services/1
  def destroy
    if @additional_service.destroy
      redirect_to additional_services_path, notice: "Additional service was successfully destroyed.", status: :see_other
    else
      redirect_to additional_services_path, alert: @additional_service.errors.full_messages.to_sentence
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_service
      @additional_service = AdditionalService.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def additional_service_params
      params.expect(additional_service: [ :name, :price ])
    end
end
