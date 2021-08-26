require 'rails_helper'

RSpec.describe "user/notes/show", type: :view do
  before(:each) do
    @user_note = assign(:user_note, User::Note.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
