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

  def monthly_average_income
    ofx_transactions.where("ofx_date > ?", 6.months.ago).where("amount > 0").sum(:amount) / 6
  end

  def average_expenses_left_for_month
    daily_average_expenses * days_left_in_month
  end

  def average_income_left_for_month
    daily_average_income * days_left_in_month
  end

  def daily_average_expenses
    monthly_average_expenses / Time.days_in_month(Date.today.month)
  end

  def daily_average_income
    monthly_average_income / Time.days_in_month(Date.today.month)
  end

  def days_left_in_month
    (Time.days_in_month(Date.today.month) - Date.today.day)
  end
end
