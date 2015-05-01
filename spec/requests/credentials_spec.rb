require 'rails_helper'

RSpec.describe "Credentials", type: :request do
  describe "GET /credentials" do
    it "works! (now write some real specs)" do
      get api_v1_credentials_path
      expect(response).to have_http_status(200)
    end
  end
end
