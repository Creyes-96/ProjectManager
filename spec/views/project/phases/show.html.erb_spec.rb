require 'rails_helper'

RSpec.describe "project/phases/show", type: :view do
  before(:each) do
    @project_phase = assign(:project_phase, Project::Phase.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
