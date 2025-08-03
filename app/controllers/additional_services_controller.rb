class AdditionalServicesController < ApplicationController
  before_action :set_additional_service, only: %i[ show edit update ]

  def index
    @additional_services = AdditionalService.all
  end

  def show
  end

  def new
    @additional_service = AdditionalService.new
  end

  def edit
  end

  def create
    @additional_service = AdditionalService.create!(additional_service_params)
    redirect_to @additional_service, notice: "Additional service was successfully created."
  end

  def update
    @additional_service.update!(additional_service_params)
    redirect_to @additional_service, notice: "Additional service was successfully updated."
  end

  private

    def set_additional_service
      @additional_service = AdditionalService.find(params.expect(:id))
    end

    def additional_service_params
      params.expect(additional_service: [ :name, :price ])
    end
end
