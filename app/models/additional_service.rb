class AdditionalService < ApplicationRecord
  has_and_belongs_to_many :packages
  has_and_belongs_to_many :signature

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
