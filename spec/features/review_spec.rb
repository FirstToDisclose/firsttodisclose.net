require "rails_helper"

describe "Reviews" do
  before(:each) do
    @innovation = FactoryGirl.create(:innovation)
  end

  feature "review an innovation" do
    it "can be submitted when valid" do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      visit innovation_path(@innovation)

      select "1", from: "Novelty"
      select "2", from: "Usability"
      select "3", from: "Value"
      select "4", from: "Fourth"
      select "5", from: "Fifth"
      fill_in "Body", with: "A text review of the innovation"
      click_on "Submit Review"

      expect(page).to have_content "Review Submitted"
      expect(page).to have_content "A text review of the innovation"
    end

    it "must be signed in" do
      visit innovation_path(@innovation)

      expect(page).not_to have_selector ".review-fields"
    end

    it "can only review an innovation once" do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      visit innovation_path(@innovation)

      select "1", from: "Novelty"
      select "2", from: "Usability"
      select "3", from: "Value"
      select "4", from: "Fourth"
      select "5", from: "Fifth"
      fill_in "Body", with: "A text review of the innovation"
      click_on "Submit Review"

      expect(page).not_to have_selector ".review-fields"
    end
  end
end
