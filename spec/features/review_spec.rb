require "rails_helper"

describe "Reviews" do
  feature "review an innovation" do
    before(:each) do
      @innovation = FactoryGirl.create(:innovation)
      @user = FactoryGirl.create(:user, reviewer: true)
      sign_in(@user)
      visit innovation_path(@innovation)
    end

    it "can be submitted when valid" do
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
      sign_out
      visit innovation_path(@innovation)

      expect(page).not_to have_selector ".review-fields"
    end

    it "can only review an innovation once" do
      select "1", from: "Novelty"
      select "2", from: "Usability"
      select "3", from: "Value"
      select "4", from: "Fourth"
      select "5", from: "Fifth"
      fill_in "Body", with: "A text review of the innovation"
      click_on "Submit Review"

      expect(page).not_to have_selector ".review-fields"
    end

    it "must be a reviewer" do
      non_reviewer = FactoryGirl.create(:user)
      sign_in(non_reviewer)
      visit innovation_path(@innovation)

      expect(page).not_to have_selector ".review-fields"
    end
  end
end
