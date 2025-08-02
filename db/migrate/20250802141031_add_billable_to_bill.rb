class AddBillableToBill < ActiveRecord::Migration[8.0]
  def change
    add_reference :bills, :billable, polymorphic: true, null: false
  end
end
