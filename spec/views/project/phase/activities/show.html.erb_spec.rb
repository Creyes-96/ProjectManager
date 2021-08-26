require 'rails_helper'

RSpec.describe "project/phase/activities/show", type: :view do
  before(:each) do
    @project/phase_activity = assign(:project/phase_activity, Project::Phase::Activity.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
