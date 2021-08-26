require "rails_helper"

RSpec.describe Project::Phase::ActivitiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project/phase/activities").to route_to("project/phase/activities#index")
    end

    it "routes to #new" do
      expect(get: "/project/phase/activities/new").to route_to("project/phase/activities#new")
    end

    it "routes to #show" do
      expect(get: "/project/phase/activities/1").to route_to("project/phase/activities#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project/phase/activities/1/edit").to route_to("project/phase/activities#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project/phase/activities").to route_to("project/phase/activities#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project/phase/activities/1").to route_to("project/phase/activities#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project/phase/activities/1").to route_to("project/phase/activities#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project/phase/activities/1").to route_to("project/phase/activities#destroy", id: "1")
    end
  end
end
