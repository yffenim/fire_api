require "rails_helper"

RSpec.describe SecondsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/seconds").to route_to("seconds#index")
    end

    it "routes to #show" do
      expect(get: "/seconds/1").to route_to("seconds#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/seconds").to route_to("seconds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/seconds/1").to route_to("seconds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/seconds/1").to route_to("seconds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/seconds/1").to route_to("seconds#destroy", id: "1")
    end
  end
end
