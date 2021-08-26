require 'rails_helper'

RSpec.describe "project/phases/index", type: :view do
  before(:each) do
    assign(:project_phases, [
      Project::Phase.create!(),
      Project::Phase.create!()
    ])
  end

  it "renders a list of project/phases" do
    render
  end
end
