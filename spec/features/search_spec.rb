require "rails_helper"

describe "Search" do
  feature "Search for an innovation" do
    before(:each) do
      @innovation = FactoryGirl.create(:innovation)
      visit innovations_path
    end

    it "returns an exisiting innovation" do
      fill_in "search", with: @innovation.title
      click_on "Search"

      expect(page).to have_content "Listing Innovations"
      expect(page).to have_content @innovation.title
    end

    it "returns a message if no innovations are found" do
      fill_in "search", with: "Bacon Pancakes"
      click_on "Search"

      expect(page).to have_content "Sorry, there were no innovations found"
    end

    it "returns no results for a blank query" do
      click_on "Search"

      expect(page).to have_content "Sorry, there were no innovations found"
    end
  end
end
