require 'rails_helper'

RSpec.describe "project/phase/milestone/notes/new", type: :view do
  before(:each) do
    assign(:project/phase/milestone_note, Project::Phase::Milestone::Note.new())
  end

  it "renders new project/phase/milestone_note form" do
    render

    assert_select "form[action=?][method=?]", project_phase_milestone_notes_path, "post" do
    end
  end
end
