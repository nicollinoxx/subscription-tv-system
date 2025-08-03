class Customer < ApplicationRecord
  has_many :signatures, dependent: :destroy
end
