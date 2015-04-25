require "rails_helper"

describe "Revisions" do
  feature "creating a revision when updating innovation" do
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in(user)
      @innovation = FactoryGirl.create(:innovation, user: user)
    end

    it "should maintain the innovation's attributes" do
      title = @innovation.title
      abstract = @innovation.abstract
      body = @innovation.body
      consented = @innovation.consented
      user = @innovation.user

      visit edit_innovation_path(@innovation)


      fill_in "Title", with: "A New Title!"
      fill_in "Abstract", with: "A new abstract for this innovation" * 10
      fill_in "Body", with: "A new body for this innovation" * 20
      check "innovation_consented"
      click_on "Update Innovation"

      revision = @innovation.revisions.first

      expect(revision.title).to eq(title)
      expect(revision.abstract).to eq(abstract)
      expect(revision.body).to eq(body)
      expect(revision.consented).to eq(consented)
      expect(revision.user).to eq(user)
      expect(@innovation.revisions.count).to eq(1)
    end
  end
end
