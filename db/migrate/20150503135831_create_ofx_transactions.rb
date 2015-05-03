class CreateOfxTransactions < ActiveRecord::Migration
  def change
    create_table :ofx_transactions do |t|
      t.decimal :amount
      t.string :description
      t.datetime :ofx_date
      t.integer :ofx_id
      t.references :scheduled_transaction, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
