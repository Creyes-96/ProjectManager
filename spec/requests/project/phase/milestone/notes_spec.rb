 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/project/phase/milestone/notes", type: :request do
  
  # Project::Phase::Milestone::Note. As you add validations to Project::Phase::Milestone::Note, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Project::Phase::Milestone::Note.create! valid_attributes
      get project_phase_milestone_notes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      note = Project::Phase::Milestone::Note.create! valid_attributes
      get project_phase_milestone_note_url(project_phase_milestone_note)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_project_phase_milestone_note_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      note = Project::Phase::Milestone::Note.create! valid_attributes
      get edit_project_phase_milestone_note_url(project_phase_milestone_note)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Project::Phase::Milestone::Note" do
        expect {
          post project_phase_milestone_notes_url, params: { project/phase/milestone_note: valid_attributes }
        }.to change(Project::Phase::Milestone::Note, :count).by(1)
      end

      it "redirects to the created project/phase/milestone_note" do
        post project_phase_milestone_notes_url, params: { project/phase/milestone_note: valid_attributes }
        expect(response).to redirect_to(project_phase_milestone_note_url(@project_phase_milestone_note))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Project::Phase::Milestone::Note" do
        expect {
          post project_phase_milestone_notes_url, params: { project/phase/milestone_note: invalid_attributes }
        }.to change(Project::Phase::Milestone::Note, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post project_phase_milestone_notes_url, params: { project/phase/milestone_note: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested project/phase/milestone_note" do
        note = Project::Phase::Milestone::Note.create! valid_attributes
        patch project_phase_milestone_note_url(project_phase_milestone_note), params: { project_phase_milestone_note: new_attributes }
        note.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the project/phase/milestone_note" do
        note = Project::Phase::Milestone::Note.create! valid_attributes
        patch project_phase_milestone_note_url(project_phase_milestone_note), params: { project_phase_milestone_note: new_attributes }
        note.reload
        expect(response).to redirect_to(project_phase_milestone_note_url(note))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        note = Project::Phase::Milestone::Note.create! valid_attributes
        patch project_phase_milestone_note_url(project_phase_milestone_note), params: { project_phase_milestone_note: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested project/phase/milestone_note" do
      note = Project::Phase::Milestone::Note.create! valid_attributes
      expect {
        delete project_phase_milestone_note_url(project_phase_milestone_note)
      }.to change(Project::Phase::Milestone::Note, :count).by(-1)
    end

    it "redirects to the project_phase_milestone_notes list" do
      note = Project::Phase::Milestone::Note.create! valid_attributes
      delete project_phase_milestone_note_url(project_phase_milestone_note)
      expect(response).to redirect_to(project_phase_milestone_notes_url)
    end
  end
end
