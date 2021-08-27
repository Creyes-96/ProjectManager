require 'rails_helper'

RSpec.describe "project/phase/milestone/notes/edit", type: :view do
  before(:each) do
    @project/phase/milestone_note = assign(:project/phase/milestone_note, Project::Phase::Milestone::Note.create!())
  end

  it "renders the edit project/phase/milestone_note form" do
    render

    assert_select "form[action=?][method=?]", project/phase/milestone_note_path(@project/phase/milestone_note), "post" do
    end
  end
end
