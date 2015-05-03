class AddAccountToScheduledTransaction < ActiveRecord::Migration
  def change
    add_reference :scheduled_transactions, :account, index: true, foreign_key: true
  end
end
