require "rails_helper"

describe "Disclosures" do
  feature "creating a disclosure" do
    it "accepts valid attributes" do
      visit new_disclosure_path

      fill_in "Title", with: "My New Valid Disclosure"
      fill_in "Abstract", with: "This is my disclosure" * 10
      fill_in "Body", with: "Here is a detailed description of my disclosure" * 30
      check "Consented"
      click_on "Create Disclosure"

      expect(page).to have_content "Disclosure was successfully created"
      expect(page).to have_content "My New Valid Disclosure"
    end

    it "rejects invalid attributes" do
      visit new_disclosure_path

      click_on "Create Disclosure"

      expect(page).to have_content "can't be blank"
    end

    it "can be tagged" do
      tag = FactoryGirl.create(:tag)
      visit new_disclosure_path

      fill_in "Title", with: "My New Valid Disclosure"
      fill_in "Abstract", with: "This is my disclosure" * 10
      fill_in "Body", with: "Here is a detailed description of my disclosure" * 30
      check "Consented"
      check tag.name
      click_on "Create Disclosure"

      expect(page).to have_content "Disclosure was successfully created"
      expect(page).to have_content tag.name
    end
  end
end
