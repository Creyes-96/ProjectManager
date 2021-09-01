require 'rails_helper'

RSpec.describe "project/teams/index", type: :view do
  before(:each) do
    assign(:project_teams, [
      Project::Team.create!(),
      Project::Team.create!()
    ])
  end

  it "renders a list of project/teams" do
    render
  end
end
