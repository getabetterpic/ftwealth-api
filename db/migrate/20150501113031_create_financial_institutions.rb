class CreateFinancialInstitutions < ActiveRecord::Migration
  def change
    create_table :financial_institutions do |t|
      t.string :name, index: true, unique: true
      t.string :fid, index: true, unique: true
      t.string :org, unique: true
      t.string :url, unique: true
      t.date :last_ofx_validation
      t.date :last_ssl_validation
      t.text :ofx_template
      t.string :sync_type
      t.string :sync_class

      t.timestamps null: false
    end
  end
end
