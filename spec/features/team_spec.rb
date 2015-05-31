require "rails_helper"

describe "Teams" do
  describe "creating a team" do
    before(:each) do
      @team_leader = FactoryGirl.create(:user)
      @event = FactoryGirl.create(:event)
      EventMembership.create(event: @event, user: @team_leader)
    end

    it "can be created from the event page" do
      login_as(@team_leader)
      visit event_path(@event)
      click_on "Start a Team"

      fill_in "Team name", with: "Mongooses"
      click_on "Create Team"

      expect(page).to have_content "Team created"
      expect(page).to have_content "Mongooses"
    end
  end

  describe "joining a team" do
    it "can be requested from the team page" do
      team = FactoryGirl.create(:team, user: @team_leader, event: @event)
      user = FactoryGirl.create(:user)
      login_as(user)

      visit team_path(team)
      click_on "Join Team"

      expect(page).to have_content "Team membership requested. Your membership will be official once approved by the team leader"
    end
  end
end
