require "rails_helper"

RSpec.describe TransController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/trans").to route_to("trans#index")
    end

    it "routes to #new" do
      expect(:get => "/trans/new").to route_to("trans#new")
    end

    it "routes to #show" do
      expect(:get => "/trans/1").to route_to("trans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/trans/1/edit").to route_to("trans#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/trans").to route_to("trans#create")
    end

    it "routes to #update" do
      expect(:put => "/trans/1").to route_to("trans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/trans/1").to route_to("trans#destroy", :id => "1")
    end

  end
end
