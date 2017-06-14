require "rails_helper"

RSpec.describe PhrasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/phrases").to route_to("phrases#index")
    end

    it "routes to #new" do
      expect(:get => "/phrases/new").to route_to("phrases#new")
    end

    it "routes to #show" do
      expect(:get => "/phrases/1").to route_to("phrases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/phrases/1/edit").to route_to("phrases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/phrases").to route_to("phrases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/phrases/1").to route_to("phrases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/phrases/1").to route_to("phrases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/phrases/1").to route_to("phrases#destroy", :id => "1")
    end

  end
end
