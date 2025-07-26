class AddPlanOrPackageToSignatures < ActiveRecord::Migration[8.0]
  def change
    add_reference :signatures, :plan, null: true, foreign_key: true
    add_reference :signatures, :package, null: true, foreign_key: true
  end
end
