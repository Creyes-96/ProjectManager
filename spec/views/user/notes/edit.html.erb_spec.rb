require 'rails_helper'

RSpec.describe "user/notes/edit", type: :view do
  before(:each) do
    @user_note = assign(:user_note, User::Note.create!())
  end

  it "renders the edit user_note form" do
    render

    assert_select "form[action=?][method=?]", user_note_path(@user_note), "post" do
    end
  end
end
