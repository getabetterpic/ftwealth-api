require "rails_helper"

RSpec.describe OfxTransactionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ofx_transactions").to route_to("ofx_transactions#index")
    end

    it "routes to #new" do
      expect(:get => "/ofx_transactions/new").to route_to("ofx_transactions#new")
    end

    it "routes to #show" do
      expect(:get => "/ofx_transactions/1").to route_to("ofx_transactions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ofx_transactions/1/edit").to route_to("ofx_transactions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ofx_transactions").to route_to("ofx_transactions#create")
    end

    it "routes to #update" do
      expect(:put => "/ofx_transactions/1").to route_to("ofx_transactions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ofx_transactions/1").to route_to("ofx_transactions#destroy", :id => "1")
    end

  end
end
