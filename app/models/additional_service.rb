class AdditionalService < ApplicationRecord
  has_and_belongs_to_many :packages
  has_and_belongs_to_many :signatures

  has_many :bills, as: :billable
end
