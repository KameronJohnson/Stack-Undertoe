require 'rails_helper'

describe "the add a question process" do
  it "creates a new question", js: true do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on "New Question"
    fill_in "Title", :with => "Capybara Ghost"
    fill_in "Question", :with => "Boo?"
    click_button "Create Question"
    expect(page).to have_content 'Capybara Ghost'
  end
end
