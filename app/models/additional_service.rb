class AdditionalService < ApplicationRecord
  include LinkedRecordsProtection

  has_and_belongs_to_many :packages
  has_and_belongs_to_many :signatures

  has_many :bills, as: :billable

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
