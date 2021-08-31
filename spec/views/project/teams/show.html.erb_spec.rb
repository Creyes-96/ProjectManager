require 'rails_helper'

RSpec.describe "project/teams/show", type: :view do
  before(:each) do
    @project_team = assign(:project_team, Project::Team.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
