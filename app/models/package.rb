class Package < ApplicationRecord
  belongs_to :plan

  validates :name, :price, presence: true
  validates :price, numericality: { only_integer: true }
end
