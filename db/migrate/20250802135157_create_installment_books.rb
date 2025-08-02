class CreateInstallmentBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :installment_books do |t|
      t.datetime :due_date
      t.decimal :price

      t.timestamps
    end
  end
end
