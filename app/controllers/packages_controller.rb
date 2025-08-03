class PackagesController < ApplicationController
  before_action :set_package, only: %i[ show edit update ]

  def index
    @packages = Package.all
  end

  def show
  end

  def new
    @package = Package.new
  end

  def edit
  end

  def create
    @package = Package.create!(package_params)
    redirect_to @package, notice: "Package was successfully created."
  end

  def update
    @package.update!(package_params)
    redirect_to @package, notice: "Package was successfully updated."
  end

  private

    def set_package
      @package = Package.find(params.expect(:id))
    end

    def package_params
      params.expect(package: [ :name, :price, :plan_id, additional_service_ids: [] ])
    end
end
