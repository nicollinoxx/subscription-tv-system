class Plan < ApplicationRecord
  has_many :packages

  validates :name, :price, presence: true
  validates :price, numericality: { only_integer: true }
end
