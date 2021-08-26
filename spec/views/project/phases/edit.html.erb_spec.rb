require 'rails_helper'

RSpec.describe "project/phases/edit", type: :view do
  before(:each) do
    @project_phase = assign(:project_phase, Project::Phase.create!())
  end

  it "renders the edit project_phase form" do
    render

    assert_select "form[action=?][method=?]", project_phase_path(@project_phase), "post" do
    end
  end
end
