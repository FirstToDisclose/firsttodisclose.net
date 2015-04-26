require "rails_helper"

describe "Admin: Innovations" do
  feature "hiding innovations" do
    before(:each) do
      @admin = FactoryGirl.create(:user, admin: true)
      sign_in(@admin)
      @innovation = FactoryGirl.create(:innovation)
    end

    it "can be done by admins from the index" do
      visit admin_innovations_path

      expect(page).to have_link @innovation.title

      click_link "Hide #{@innovation.title}"

      expect(page).to have_link "Unhide Innovation"
      expect(page).to have_content "This Innovation is currently hidden"

      visit admin_innovations_path

      expect(page).not_to have_link "Hide #{@innovation.title}"
      expect(page).to have_link "Unhide #{@innovation.title}"
      expect(page).to have_content "Hidden - #{@innovation.title}"
    end

    it "can be done by admins from the show page" do
      visit admin_innovation_path(@innovation)

      click_link "Hide Innovation"

      expect(page).to have_link "Unhide Innovation"
      expect(page).to have_content "This Innovation is currently hidden"
    end
  end
end
