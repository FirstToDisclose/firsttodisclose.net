require "rails_helper"

describe "Innovations" do
  feature "creating a Innovation" do
    it "accepts valid attributes" do
      visit new_innovation_path

      fill_in "Title", with: "My New Valid Innovation"
      fill_in "Abstract", with: "This is my Innovation" * 10
      fill_in "Body", with: "Here is a detailed description of my Innovation" * 30
      check "Consented"
      click_on "Create Innovation"

      expect(page).to have_content "Innovation was successfully created"
      expect(page).to have_content "My New Valid Innovation"
    end

    it "rejects invalid attributes" do
      visit new_innovation_path

      click_on "Create Innovation"

      expect(page).to have_content "can't be blank"
    end

    it "can be tagged" do
      tag = FactoryGirl.create(:tag)
      visit new_innovation_path

      fill_in "Title", with: "My New Valid Innovation"
      fill_in "Abstract", with: "This is my Innovation" * 10
      fill_in "Body", with: "Here is a detailed description of my Innovation" * 30
      check "Consented"
      check tag.name
      click_on "Create Innovation"

      expect(page).to have_content "Innovation was successfully created"
      expect(page).to have_link tag.name
    end
  end

  feature "index page" do
    it "has links to each Innovation" do
      Innovation_1 = FactoryGirl.create(:innovation)
      Innovation_2 = FactoryGirl.create(:innovation)

      visit innovations_path

      expect(page).to have_link Innovation_1.title
      expect(page).to have_link Innovation_2.title
    end
  end
end
