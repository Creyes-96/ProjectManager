require 'rails_helper'

RSpec.describe "project/phase/milestones/show", type: :view do
  before(:each) do
    @project/phase_milestone = assign(:project/phase_milestone, Project::Phase::Milestone.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
