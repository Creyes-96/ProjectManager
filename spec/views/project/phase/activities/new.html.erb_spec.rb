require 'rails_helper'

RSpec.describe "project/phase/activities/new", type: :view do
  before(:each) do
    assign(:project/phase_activity, Project::Phase::Activity.new())
  end

  it "renders new project/phase_activity form" do
    render

    assert_select "form[action=?][method=?]", project_phase_activities_path, "post" do
    end
  end
end
