class Bill < ApplicationRecord
  belongs_to :billable, polymorphic: true
  belongs_to :signature
end
