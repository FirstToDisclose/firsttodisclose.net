require "rails_helper"

describe "Search" do
  feature "Search for an innovation" do

    it "returns an exisiting innovation" do
      innovation = FactoryGirl.create(:innovation)

      visit search_path
      fill_in "search_bar", with: innovation.title
      click_on "Search"

      expect(page).to have_content innovation.title
    end

    it "returns a message if no innovations are found" do
      visit search_path
      fill_in "search_bar", with: "Bacon Pancakes"
      click_on "Search"

      expect(page).to have_content "No results found for \"Bacon Pancakes\" "
    end
  end
end
