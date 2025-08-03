class Signature < ApplicationRecord
  include Billable

  belongs_to :customer
  belongs_to :plan, optional: true
  belongs_to :package, optional: true

  has_and_belongs_to_many :additional_services
  has_many :invoices, dependent: :destroy
  has_many :bills, dependent: :destroy
  has_one  :installment_book, dependent: :destroy

  validate :should_have_package_or_plan, :should_not_duplicate_additional_services

  private

    def should_have_package_or_plan
      errors.add(:base, "Must have either a package or a plan, not both") unless has_plan_or_package?
    end

    def should_not_duplicate_additional_services
      errors.add(:base, "The chosen additional services are already in the package") if has_repeated_additional_services?
    end

    def has_repeated_additional_services?
      (package.additional_service_ids & additional_service_ids).any? if package.present?
    end

    def has_plan_or_package?
      plan.present? != package.present?
    end
end
