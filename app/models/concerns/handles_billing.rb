module HandlesBilling
  extend ActiveSupport::Concern

  included do
    after_create :manage_bills
  end

  private

    def create_bills
      create_bills_to plan || package
      additional_services.each { |service| create_bills_to service }
    end

    def create_bills_to item
      12.times { |date| bills.create(billable: item, due_date: self.created_at + date.month, price: item.price) }
    end
end
