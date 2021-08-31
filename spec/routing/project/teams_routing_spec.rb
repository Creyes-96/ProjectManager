require "rails_helper"

RSpec.describe Project::TeamsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project/teams").to route_to("project/teams#index")
    end

    it "routes to #new" do
      expect(get: "/project/teams/new").to route_to("project/teams#new")
    end

    it "routes to #show" do
      expect(get: "/project/teams/1").to route_to("project/teams#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project/teams/1/edit").to route_to("project/teams#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project/teams").to route_to("project/teams#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project/teams/1").to route_to("project/teams#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project/teams/1").to route_to("project/teams#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project/teams/1").to route_to("project/teams#destroy", id: "1")
    end
  end
end
