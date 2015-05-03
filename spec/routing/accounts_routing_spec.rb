require "rails_helper"

RSpec.describe Api::V1::AccountsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/accounts").to route_to("accounts#index")
    end

    it "routes to #new" do
      expect(:get => "/api/v1/accounts/new").to route_to("accounts#new")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/accounts/1").to route_to("accounts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/v1/accounts/1/edit").to route_to("accounts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/accounts").to route_to("accounts#create")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/accounts/1").to route_to("accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/accounts/1").to route_to("accounts#destroy", :id => "1")
    end

  end
end
