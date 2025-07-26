class PackagesController < ApplicationController
  before_action :set_package, only: %i[ show edit update destroy ]

  # GET /packages
  def index
    @packages = Package.all
  end

  # GET /packages/1
  def show
  end

  # GET /packages/new
  def new
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  def create
    @package = Package.new(package_params)

    if @package.save
      redirect_to @package, notice: "Package was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packages/1
  def update
    if @package.update(package_params)
      redirect_to @package, notice: "Package was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /packages/1
  def destroy
    @package.destroy!
    redirect_to packages_path, notice: "Package was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def package_params
      params.expect(package: [ :name, :price, :plan_id ])
    end
end
