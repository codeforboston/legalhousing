require "rails_helper"

RSpec.describe ScrapersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/scrapers").to route_to("scrapers#index")
    end

    it "routes to #new" do
      expect(:get => "/scrapers/new").to route_to("scrapers#new")
    end

    it "routes to #show" do
      expect(:get => "/scrapers/1").to route_to("scrapers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/scrapers/1/edit").to route_to("scrapers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/scrapers").to route_to("scrapers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/scrapers/1").to route_to("scrapers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/scrapers/1").to route_to("scrapers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/scrapers/1").to route_to("scrapers#destroy", :id => "1")
    end

  end
end
