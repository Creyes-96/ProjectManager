require "rails_helper"

RSpec.describe Project::Phase::MilestonesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project/phase/milestones").to route_to("project/phase/milestones#index")
    end

    it "routes to #new" do
      expect(get: "/project/phase/milestones/new").to route_to("project/phase/milestones#new")
    end

    it "routes to #show" do
      expect(get: "/project/phase/milestones/1").to route_to("project/phase/milestones#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project/phase/milestones/1/edit").to route_to("project/phase/milestones#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project/phase/milestones").to route_to("project/phase/milestones#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project/phase/milestones/1").to route_to("project/phase/milestones#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project/phase/milestones/1").to route_to("project/phase/milestones#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project/phase/milestones/1").to route_to("project/phase/milestones#destroy", id: "1")
    end
  end
end
