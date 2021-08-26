require 'rails_helper'

RSpec.describe "user/notes/new", type: :view do
  before(:each) do
    assign(:user_note, User::Note.new())
  end

  it "renders new user_note form" do
    render

    assert_select "form[action=?][method=?]", user_notes_path, "post" do
    end
  end
end
