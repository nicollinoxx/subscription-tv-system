class Package < ApplicationRecord
  belongs_to :plan

  has_and_belongs_to_many :additional_services
  has_many :signatures
  has_many :bills, as: :billable

  before_save :calculate_total_items, unless: -> { price.present? }

  private

    def calculate_total_items
      self.price = plan.price + additional_services.sum(&:price)
    end
end
