class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :description
      t.datetime :tran_date
      t.references :account, index: true, foreign_key: true
      t.actable

      t.timestamps null: false
    end
  end
end
