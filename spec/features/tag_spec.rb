require "rails_helper"

describe "Tags" do
  feature "show page" do
    it "displays associated disclosures" do
      tag = FactoryGirl.create(:tag)
      disclosure_1 = FactoryGirl.create(:disclosure)
      disclosure_2 = FactoryGirl.create(:disclosure)
      FactoryGirl.create(:disclosure_tag, tag: tag, disclosure: disclosure_1)
      FactoryGirl.create(:disclosure_tag, tag: tag, disclosure: disclosure_2)

      visit tag_path(tag)

      expect(page).to have_content tag.name
      expect(page).to have_link disclosure_1.title
      expect(page).to have_link disclosure_2.title
    end
  end

  feature "index page" do
    it "displays links to each tag" do
      tag_1 = FactoryGirl.create(:tag)
      tag_2 = FactoryGirl.create(:tag)

      visit tags_path

      expect(page).to have_link tag_1.name
      expect(page).to have_link tag_2.name
    end
  end
end
