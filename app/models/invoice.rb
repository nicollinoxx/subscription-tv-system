class Invoice < ApplicationRecord
  belongs_to :signature

  before_save :set_total_price

  private

    def set_total_price
      self.price = (signature.plan.price || signature.package.price) + signature&.additional_services.sum(:price)
    end
end
