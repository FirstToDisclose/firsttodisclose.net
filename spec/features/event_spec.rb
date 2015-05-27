require "rails_helper"

describe "Events" do
  describe "creating an event" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as(@user)
    end

    it "can be created by a user" do
      visit root_path
      click_on "New Event"

      fill_in "Title", with: "My New Hackathon"
      fill_in "Start time", with: DateTime.now + 1.day
      fill_in "End time", with: DateTime.now + 3.days
      fill_in "Street 1", with: "66 Kenzel Ave"
      fill_in "Street 2", with: "Unit 1"
      fill_in "City", with: "Nutley"
      select "New Jersey", from: "State"
      fill_in "Postal code", with: "07110"
      click_on "Create Event"

      expect(page).to have_content "Event created successfully"
      expect(page).to have_content "My New Hackathon"
    end
  end
end
