require 'rails_helper'

RSpec.describe "project/phases/new", type: :view do
  before(:each) do
    assign(:project_phase, Project::Phase.new())
  end

  it "renders new project_phase form" do
    render

    assert_select "form[action=?][method=?]", project_phases_path, "post" do
    end
  end
end
