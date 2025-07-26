class Package < ApplicationRecord
  belongs_to :plan

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
