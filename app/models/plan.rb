class Plan < ApplicationRecord
  has_many :packages
  has_many :signatures
  has_many :bills, as: :billable
end
