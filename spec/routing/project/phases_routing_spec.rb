require "rails_helper"

RSpec.describe Project::PhasesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project/phases").to route_to("project/phases#index")
    end

    it "routes to #new" do
      expect(get: "/project/phases/new").to route_to("project/phases#new")
    end

    it "routes to #show" do
      expect(get: "/project/phases/1").to route_to("project/phases#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project/phases/1/edit").to route_to("project/phases#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project/phases").to route_to("project/phases#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project/phases/1").to route_to("project/phases#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project/phases/1").to route_to("project/phases#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project/phases/1").to route_to("project/phases#destroy", id: "1")
    end
  end
end
