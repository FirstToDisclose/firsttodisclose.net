require "rails_helper"

feature "Collections" do
  context "creating a collection" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      visit new_collection_path
    end

    it "accepts valid parameters" do
      fill_in "Title", with: "My Collection"
      click_on "Create Collection"

      expect(page).to have_content "My Collection"
      expect(page).to have_content "Collection was successfully created"
    end
  end

  context "adding innovations" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in(@user)
      @collection = FactoryGirl.create(:collection)
    end

    it "can be added to the collection" do
      innovation_1 = FactoryGirl.create(:innovation)
      innovation_2 = FactoryGirl.create(:innovation)

      visit collection_path(@collection)
      click_on "Add innovations to this collection"
      click_on innovation_1.title

      click_on "Add innovations to this collection"
      click_on innovation_2.title

      expect(page).to have_link innovation_1.title
      expect(page).to have_link innovation_2.title
      expect(page).to have_content "Innovation #{innovation_2.title} was successfully added"
    end
  end
end
