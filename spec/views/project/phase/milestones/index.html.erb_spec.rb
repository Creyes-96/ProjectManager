require 'rails_helper'

RSpec.describe "project/phase/milestones/index", type: :view do
  before(:each) do
    assign(:project_phase_milestones, [
      Project::Phase::Milestone.create!(),
      Project::Phase::Milestone.create!()
    ])
  end

  it "renders a list of project/phase/milestones" do
    render
  end
end
