class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show edit update ]

  def index
    @plans = Plan.all
  end

  def show
  end

  def new
    @plan = Plan.new
  end

  def edit
  end

  def create
    @plan = Plan.create!(plan_params)
    redirect_to @plan, notice: "Plan was successfully created."
  end

  def update
    @plan.update!(plan_params)
    redirect_to @plan, notice: "Plan was successfully updated."
  end

  private

    def set_plan
      @plan = Plan.find(params.expect(:id))
    end

    def plan_params
      params.expect(plan: [ :name, :price ])
    end
end
