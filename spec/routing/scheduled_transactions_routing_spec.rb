require "rails_helper"

RSpec.describe ScheduledTransactionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scheduled_transactions").to route_to("scheduled_transactions#index")
    end

    it "routes to #new" do
      expect(:get => "/scheduled_transactions/new").to route_to("scheduled_transactions#new")
    end

    it "routes to #show" do
      expect(:get => "/scheduled_transactions/1").to route_to("scheduled_transactions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scheduled_transactions/1/edit").to route_to("scheduled_transactions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/scheduled_transactions").to route_to("scheduled_transactions#create")
    end

    it "routes to #update" do
      expect(:put => "/scheduled_transactions/1").to route_to("scheduled_transactions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scheduled_transactions/1").to route_to("scheduled_transactions#destroy", :id => "1")
    end

  end
end
