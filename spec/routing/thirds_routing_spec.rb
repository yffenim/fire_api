require "rails_helper"

RSpec.describe ThirdsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/thirds").to route_to("thirds#index")
    end

    it "routes to #show" do
      expect(get: "/thirds/1").to route_to("thirds#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/thirds").to route_to("thirds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/thirds/1").to route_to("thirds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/thirds/1").to route_to("thirds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/thirds/1").to route_to("thirds#destroy", id: "1")
    end
  end
end
