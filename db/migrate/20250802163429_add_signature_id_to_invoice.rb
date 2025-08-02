class AddSignatureIdToInvoice < ActiveRecord::Migration[8.0]
  def change
    add_reference :invoices, :signature, null: false, foreign_key: true
  end
end
