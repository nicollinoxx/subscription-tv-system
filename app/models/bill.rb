class Bill < ApplicationRecord
  belongs_to :billable, polymorphic: true
end
