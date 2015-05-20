require "rails_helper"

describe "Admin: LivePages" do
  feature "adding a hangout" do
    it "can be done from the admin live page" do
      admin = FactoryGirl.create(:user, admin: true)
      sign_in(admin)
      live_page = FactoryGirl.create(:live_page, hangout_url: "http://www.youtube.com/embed/ymhrqavPM91")

      hangout_url = "http://www.youtube.com/embed/ymhrqavPM9o"

      visit live_pages_path
      click_on "Add a Hangout"

      fill_in "Hangout URL", with: hangout_url
      click_on "Submit Hangout"

      expect(page).to have_xpath("//iframe[@src='#{hangout_url}']")
    end
  end
end
