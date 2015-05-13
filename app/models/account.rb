class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :financial_institution
  belongs_to :credential
  has_many :ofx_transactions
  has_many :scheduled_transactions
  has_many :ofx_calls
  validates_presence_of :credential_id, :user_id, :financial_institution_id
  validates :reference, uniqueness: { scope: :financial_institution }

  MAX_SYNC_INTERVAL = 1.hour.ago

  def sync(passkey, force_sync = false)
    if (self.last_synced_at || DateTime.now) > MAX_SYNC_INTERVAL && !force_sync
      return []
    end
    self.last_synced_at = DateTime.now
    sync = financial_institution.sync_class.constantize.new
    sync.get_transactions(self, passkey)
  end

  def monthly_average_expenses
    ofx_transactions.where("ofx_date > ?", 6.months.ago).where("amount < 0").sum(:amount) / 6
  end
end
