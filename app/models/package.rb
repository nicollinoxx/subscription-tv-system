class Package < ApplicationRecord
  belongs_to :plan

  has_and_belongs_to_many :additional_services
  has_many :signatures

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validate  :should_have_at_least_one_additional_service
  before_save :calculate_total_items, unless: -> { price.present? }

  private

    def should_have_at_least_one_additional_service
      errors.add(:base, "Package must have at least one additional service") unless additional_services.any?
    end

    def calculate_total_items
      self.price = plan.price + additional_services.sum(:price)
    end
end
