class Invoice < ApplicationRecord
  belongs_to :signature
  before_save :set_total_price

  def set_total_price
    self.price = total_price
  end

  private

    def total_price
      (signature.plan.price || signature.package.price) + signature&.additional_services.sum(:price)
    end
end
