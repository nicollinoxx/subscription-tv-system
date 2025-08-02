class Plan < ApplicationRecord
  include LinkedRecordsProtection

  has_many :packages
  has_many :signatures
  has_many :bills, as: :billable

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
