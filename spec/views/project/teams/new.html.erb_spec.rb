require 'rails_helper'

RSpec.describe "project/teams/new", type: :view do
  before(:each) do
    assign(:project_team, Project::Team.new())
  end

  it "renders new project_team form" do
    render

    assert_select "form[action=?][method=?]", project_teams_path, "post" do
    end
  end
end
