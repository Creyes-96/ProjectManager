require 'rails_helper'

RSpec.describe "project/phase/milestones/new", type: :view do
  before(:each) do
    assign(:project/phase_milestone, Project::Phase::Milestone.new())
  end

  it "renders new project/phase_milestone form" do
    render

    assert_select "form[action=?][method=?]", project_phase_milestones_path, "post" do
    end
  end
end
