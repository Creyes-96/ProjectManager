require 'rails_helper'

RSpec.describe "project/teams/edit", type: :view do
  before(:each) do
    @project_team = assign(:project_team, Project::Team.create!())
  end

  it "renders the edit project_team form" do
    render

    assert_select "form[action=?][method=?]", project_team_path(@project_team), "post" do
    end
  end
end
