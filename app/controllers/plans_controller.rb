class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show edit update destroy ]

  # GET /plans
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to @plan, notice: "Plan was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  def update
    if @plan.update(plan_params)
      redirect_to @plan, notice: "Plan was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  def destroy
    if @plan.destroy
      redirect_to plans_path, notice: "Plan was successfully destroyed.", status: :see_other
    else
      redirect_to plans_path, alert: @plan.errors.full_messages.to_sentence
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.expect(plan: [ :name, :price ])
    end
end
