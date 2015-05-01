class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.binary :encrypted_password
      t.binary :encrypted_username
      t.references :financial_institution, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
