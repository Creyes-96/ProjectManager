require 'rails_helper'

RSpec.describe "project/phase/activities/edit", type: :view do
  before(:each) do
    @project/phase_activity = assign(:project/phase_activity, Project::Phase::Activity.create!())
  end

  it "renders the edit project/phase_activity form" do
    render

    assert_select "form[action=?][method=?]", project/phase_activity_path(@project/phase_activity), "post" do
    end
  end
end
