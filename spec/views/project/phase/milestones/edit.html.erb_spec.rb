require 'rails_helper'

RSpec.describe "project/phase/milestones/edit", type: :view do
  before(:each) do
    @project/phase_milestone = assign(:project/phase_milestone, Project::Phase::Milestone.create!())
  end

  it "renders the edit project/phase_milestone form" do
    render

    assert_select "form[action=?][method=?]", project/phase_milestone_path(@project/phase_milestone), "post" do
    end
  end
end
