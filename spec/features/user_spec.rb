require "rails_helper"

describe "Users" do
  feature "profile page" do
    before(:each) do
      @user = FactoryGirl.create(:user, name: "Test User")
      @innovation = FactoryGirl.create(:innovation, user: @user)
    end

    it "displays the user's name" do
      visit user_path(@user)

      expect(page).to have_content @user.name
    end

    it "displays the user's email if no name" do
      nameless_user = FactoryGirl.create(:user, name: nil)

      visit user_path(nameless_user)
      expect(page).to have_content nameless_user.email
    end

    it "displays a user's innovations" do
      visit user_path(@user)

      expect(page).to have_link @innovation.title
    end

    it "displays a user's innovation_tags" do
      tag = FactoryGirl.create(:tag)
      FactoryGirl.create(:innovation_tag, innovation: @innovation,
                         tag: tag, user: @user)

      visit user_path(@user)

      expect(page).to have_link tag.name
    end
  end
end
