require 'rails_helper'

RSpec.describe "OfxTransactions", type: :request do
  describe "GET /ofx_transactions" do
    it "works! (now write some real specs)" do
      get ofx_transactions_path
      expect(response).to have_http_status(200)
    end
  end
end
