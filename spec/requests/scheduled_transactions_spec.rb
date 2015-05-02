require 'rails_helper'

RSpec.describe "ScheduledTransactions", type: :request do
  describe "GET /scheduled_transactions" do
    it "works! (now write some real specs)" do
      get scheduled_transactions_path
      expect(response).to have_http_status(200)
    end
  end
end
