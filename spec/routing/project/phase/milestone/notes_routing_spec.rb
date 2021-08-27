require "rails_helper"

RSpec.describe Project::Phase::Milestone::NotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project/phase/milestone/notes").to route_to("project/phase/milestone/notes#index")
    end

    it "routes to #new" do
      expect(get: "/project/phase/milestone/notes/new").to route_to("project/phase/milestone/notes#new")
    end

    it "routes to #show" do
      expect(get: "/project/phase/milestone/notes/1").to route_to("project/phase/milestone/notes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project/phase/milestone/notes/1/edit").to route_to("project/phase/milestone/notes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project/phase/milestone/notes").to route_to("project/phase/milestone/notes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project/phase/milestone/notes/1").to route_to("project/phase/milestone/notes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project/phase/milestone/notes/1").to route_to("project/phase/milestone/notes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project/phase/milestone/notes/1").to route_to("project/phase/milestone/notes#destroy", id: "1")
    end
  end
end
