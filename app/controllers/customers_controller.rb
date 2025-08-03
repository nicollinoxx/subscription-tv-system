class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.create!(customer_params)
    redirect_to @customer, notice: "Customer was successfully created."
  end

  def update
    redirect_to @customer, notice: "Customer was successfully updated." if @customer.update!(customer_params)
  end

  def destroy
    @customer.destroy!
    redirect_to customers_path, notice: "Customer was successfully destroyed.", status: :see_other
  end

  private

    def set_customer
      @customer = Customer.find(params.expect(:id))
    end

    def customer_params
      params.expect(customer: [ :name, :age ])
    end
end
