require "rails_helper"

RSpec.describe WinConditionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/win_conditions").to route_to("win_conditions#index")
    end

    it "routes to #new" do
      expect(:get => "/win_conditions/new").to route_to("win_conditions#new")
    end

    it "routes to #show" do
      expect(:get => "/win_conditions/1").to route_to("win_conditions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/win_conditions/1/edit").to route_to("win_conditions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/win_conditions").to route_to("win_conditions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/win_conditions/1").to route_to("win_conditions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/win_conditions/1").to route_to("win_conditions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/win_conditions/1").to route_to("win_conditions#destroy", :id => "1")
    end
  end
end
