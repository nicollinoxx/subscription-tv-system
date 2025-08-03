module Signature::Billable
  extend ActiveSupport::Concern

  included do
    after_create :generate_billing_data
  end

  private

    def generate_billing_data
      create_bills
      create_invoices
      create_installment_book_to_signature
    end

    def create_bills
      create_bills_to plan || package
      additional_services.each { |service| create_bills_to service }
    end

    def create_bills_to item
      12.times { |date| bills.create(billable: item, due_date: created_at + date.month, price: item.price) }
    end

    def create_invoices
      12.times { |date| invoices.create(due_date: created_at + date.month, price: total_invoice_price) }
    end

    def total_invoice_price
      (plan&.price || package&.price) + additional_services.sum(&:price)
    end

    def create_installment_book_to_signature
      create_installment_book(due_date: Date.current + 1.month, price: invoices.first.price * 12)
    end
end
