class CreateScheduledTransactions < ActiveRecord::Migration
  def change
    create_table :scheduled_transactions do |t|
      t.decimal :amount
      t.string :description
      t.integer :day_of_month
      t.hstore :properties

      t.timestamps null: false
    end
  end
end
