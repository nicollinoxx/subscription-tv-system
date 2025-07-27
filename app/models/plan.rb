class Plan < ApplicationRecord
  include PreventDeletionIfLinked

  has_many :packages
  has_many :signatures

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
