require 'rails_helper'

RSpec.describe "project/phase/milestone/notes/show", type: :view do
  before(:each) do
    @project/phase/milestone_note = assign(:project/phase/milestone_note, Project::Phase::Milestone::Note.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
