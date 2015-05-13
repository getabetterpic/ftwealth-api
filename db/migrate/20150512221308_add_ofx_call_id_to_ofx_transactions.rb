class AddOfxCallIdToOfxTransactions < ActiveRecord::Migration
  def change
    add_reference :ofx_transactions, :ofx_call, index: true, foreign_key: true
  end
end
