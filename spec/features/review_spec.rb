require "rails_helper"

describe "Reviews" do
  before(:each) do
    @innovation = FactoryGirl.create(:innovation)
    user = FactoryGirl.create(:user)
    sign_in(user)
    visit innovation_path(@innovation)
  end

  feature "review an innovation" do
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
  end
end
