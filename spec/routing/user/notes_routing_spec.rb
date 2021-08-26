require "rails_helper"

RSpec.describe User::NotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user/notes").to route_to("user/notes#index")
    end

    it "routes to #new" do
      expect(get: "/user/notes/new").to route_to("user/notes#new")
    end

    it "routes to #show" do
      expect(get: "/user/notes/1").to route_to("user/notes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/user/notes/1/edit").to route_to("user/notes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user/notes").to route_to("user/notes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user/notes/1").to route_to("user/notes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user/notes/1").to route_to("user/notes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user/notes/1").to route_to("user/notes#destroy", id: "1")
    end
  end
end
