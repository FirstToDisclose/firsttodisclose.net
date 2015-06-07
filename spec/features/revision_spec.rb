require "rails_helper"

describe "Revisions" do
  feature "creating a revision" do
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in(user)
      @innovation = FactoryGirl.create(:innovation, user: user)
      @title = @innovation.title
      @abstract = @innovation.abstract
      @body = @innovation.body
      @consented = @innovation.consented
      @user = @innovation.user
    end

    it "should maintain the innovation's attributes when updating" do
      visit edit_innovation_path(@innovation)

      fill_in "Title", with: "A New Title!"
      fill_in "Abstract", with: "A new abstract for this innovation" * 10
      fill_in "Body", with: "A new body for this innovation" * 20
      check "innovation_consented"
      click_on "Update Innovation"

      revision = @innovation.revisions.first

      expect(revision.title).to eq(@title)
      expect(revision.abstract).to eq(@abstract)
      expect(revision.body).to eq(@body)
      expect(revision.consented).to eq(@consented)
      expect(revision.user).to eq(@user)
      expect(@innovation.revisions.count).to eq(1)
    end
  end

  feature "viewing revisions" do
    before(:each) do
      @innovation = FactoryGirl.create(:innovation)
      @revision_1 = FactoryGirl.create(:revision, innovation: @innovation, created_at: Time.now + 1)
      @revision_2 = FactoryGirl.create(:revision, innovation: @innovation, created_at: Time.now + 2, title: "Even newer title for this innovation")
    end

    it "should display all revisions for an innovation" do
      visit innovation_path(@innovation)

      click_on "View Revision History"

      expect(page).to have_link @innovation.title
      expect(page).to have_link "#{@revision_1.title}"
      expect(page).to have_link "#{@revision_2.title}"
    end

    it "should display an individual revision" do
      visit revisions_path({ innovation_id: @innovation.id })

      click_on "#{@revision_1.title}"

      expect(page).to have_link @innovation.title
      expect(page).to have_content @revision_1.title
      expect(page).to have_content @revision_1.abstract
      expect(page).to have_content @revision_1.body
      expect(page).to have_content @revision_1.created_at
    end
  end
end
