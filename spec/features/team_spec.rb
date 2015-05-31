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
    before(:each) do
      @team_leader = FactoryGirl.create(:user)
      @event = FactoryGirl.create(:event)
      EventMembership.create(event: @event, user: @team_leader)
      @team = FactoryGirl.create(:team, user: @team_leader, event: @event)
      @user = FactoryGirl.create(:user)
    end

    it "can be requested from the team page" do
      login_as(@user)

      visit team_path(@team)
      click_on "Join Team"

      expect(page).to have_content "Team membership requested. Your membership will be official once approved by the team leader"
    end

    it "must be approved by the team creator" do
      teammate = FactoryGirl.create(:teammate, user: @user, team: @team)
      login_as(@team_leader)

      visit team_path(@team)
      click_on "Approve New Members"

      expect(page).to have_content teammate.user.email

      click_on "Approve Teammate"

      expect(page).to have_content "Teammate approved"
      expect(page).to have_content teammate.user.email
    end
  end
end
