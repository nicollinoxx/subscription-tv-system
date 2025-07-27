class CreateJoinTableAdditionalServicesSignatures < ActiveRecord::Migration[8.0]
  def change
    create_join_table :additional_services, :signatures do |t|
      # t.index [:additional_service_id, :signature_id]
      # t.index [:signature_id, :additional_service_id]
    end
  end
end
