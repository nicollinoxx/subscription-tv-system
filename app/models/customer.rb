class Customer < ApplicationRecord
  validates :name, :age, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
end
