require 'rails_helper'

RSpec.describe "user/notes/index", type: :view do
  before(:each) do
    assign(:user_notes, [
      User::Note.create!(),
      User::Note.create!()
    ])
  end

  it "renders a list of user/notes" do
    render
  end
end
