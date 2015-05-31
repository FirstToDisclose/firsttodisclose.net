require "spec_helper"

describe "Teams" do
  describe "creating a team" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @event = FactoryGirl.create(:event)
      EventMembership.create(event: @event, user: @user)
    end

    it "can be created from the event page" do
      login_as(@user)
      visit event_path(@event)
      click_on "Start a Team"

      fill_in "Team name", with: "Mongooses"
      click_on "Create Team"

      expect(page).to have_content "Team created"
      expect(page).to have_content "Mongooses"
    end
  end
end
