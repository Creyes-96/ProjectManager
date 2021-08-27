require 'rails_helper'

RSpec.describe "project/phase/milestone/notes/index", type: :view do
  before(:each) do
    assign(:project_phase_milestone_notes, [
      Project::Phase::Milestone::Note.create!(),
      Project::Phase::Milestone::Note.create!()
    ])
  end

  it "renders a list of project/phase/milestone/notes" do
    render
  end
end
