class CreateScheduledTransactions < ActiveRecord::Migration
  def change
    create_table :scheduled_transactions do |t|
      t.boolean :recurring
      t.integer :day_of_month
      t.boolean :paycheck, default: false

      t.timestamps null: false
    end
  end
end
