class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.date    :due_date
      t.decimal :price

      t.timestamps
    end
  end
end
