require 'rails_helper'

RSpec.describe "project/phase/activities/index", type: :view do
  before(:each) do
    assign(:project_phase_activities, [
      Project::Phase::Activity.create!(),
      Project::Phase::Activity.create!()
    ])
  end

  it "renders a list of project/phase/activities" do
    render
  end
end
