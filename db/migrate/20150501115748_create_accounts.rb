class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :financial_institution, index: true, foreign_key: true
      t.string :reference
      t.string :account_type
      t.string :status
      t.references :credential, index: true, foreign_key: true
      t.decimal :available_balance
      t.decimal :posted_balance
      t.datetime :last_synced_at
      t.datetime :balance_as_of_date
      t.string :description
      t.string :bankid

      t.timestamps null: false
    end
  end
end
