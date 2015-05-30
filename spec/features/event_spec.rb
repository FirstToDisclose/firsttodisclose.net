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

  describe "adding collections" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @event = FactoryGirl.create(:event, user: @user)
      @collection = FactoryGirl.create(:collection)
      login_as(@user)
    end

    it "can be added from the collection page" do
      visit collection_path(@collection)
      click_on "Add to Event"

      select @event.title
      click_on "Add Collection"

      expect(page).to have_content "Collection was added to your event"

      visit event_path(@event)

      expect(page).to have_content @collection.title
    end

    it "can make new collections for the event" do
      visit event_path(@event)
      click_on "Add New Collection"

      fill_in "Title", with: "A Brand New Collection"
      click_on "Create Collection"

      expect(page).to have_content "A Brand New Collection"
      expect(page).to have_content "Collection was successfully created"
      expect(page).to have_content @event.title
    end
  end

  describe "adding members" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @event = FactoryGirl.create(:event)
    end

    it "can be requested by a user" do
      login_as(@user)

      visit event_path(@event)
      click_on "Join this Event"

      expect(page).to have_content "Request sent. Your membership will be official once the event's owner approves it."
    end

    it "must be approved by an event owner" do
      event_membership = FactoryGirl.create(:event_membership, event: @event, user: @user)
      login_as(@event.user)

      visit event_memberships_path({ event_id: @event.id })
      click_on "Approve Membership Request"
      expect(page).to have_content "Membership Status Updated"

      visit event_path(@event)
      expect(page).to have_content @user.email
    end
  end
end
