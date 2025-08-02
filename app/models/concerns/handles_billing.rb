module HandlesBilling
  extend ActiveSupport::Concern

  included do
    after_save :manage_bills
  end

  private

    def manage_bills
      create_bills_to plan || package
      additional_services.each { |service| create_bills_to service }
    end

    def destroy_bills
      items = [plan || package].compact + additional_services
      bills.where.not(billable: items).destroy_all
    end

    def create_bills_to item
      unless item.bills.exists?
        12.times { |date| bills.create(billable: item, due_date: self.created_at + date.month, price: item.price) }
      end
    end
end
