class CreateOfxCalls < ActiveRecord::Migration
  def change
    create_table :ofx_calls do |t|
      t.text :original_document
      t.datetime :requested_date
      t.decimal :dtacctup
      t.string :trnuid
      t.decimal :available_balance
      t.decimal :posted_balance
      t.references :account, index: true, foreign_key: true
      t.references :financial_institution, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
