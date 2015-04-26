require "rails_helper"

describe "Innovations" do
  feature "creating a Innovation" do
    before(:each) do
      user = FactoryGirl.create(:user)
      sign_in(user)
    end

    it "accepts valid attributes" do
      visit new_innovation_path

      fill_in "Title", with: "My New Valid Innovation"
      fill_in "Abstract", with: "This is my Innovation" * 10
      fill_in "Body", with: "Here is a detailed description of my Innovation" * 30
      check "innovation_consented"
      click_on "Create Innovation"

      expect(page).to have_content "Innovation was successfully created"
      expect(page).to have_content "My New Valid Innovation"
    end

    it "escapes HTML" do
      visit new_innovation_path

      title = "escapes HTML: <script>alert(1)</script>"
      fill_in "Title", with: title
      fill_in "Abstract", with: "My XSS <script>alert(1)</script>" * 10
      fill_in "Body", with: "Here is my XSS in Innovation <script>alert(1)</script>" * 30
      check "innovation_consented"
      click_on "Create Innovation"

      expect(page).to have_content "Innovation was successfully created"
      expect(page).to have_content title
    end

    it "preserves text" do
      visit new_innovation_path

      title = "preserves text: *foo*"
      body = "\n- foo *bar* _baz_ body text validation"
      fill_in "Title", with: title
      fill_in "Abstract", with: "\n- foo *bar* _baz_ abstract text validation" * 10
      fill_in "Body", with: body * 30
      check "innovation_consented"
      click_on "Create Innovation"

      expect(page).to have_content "Innovation was successfully created"
      expect(page).to have_content title
      expect(page).to have_content body
    end

    it "rejects invalid attributes" do
      visit new_innovation_path

      click_on "Create Innovation"

      expect(page).to have_content "can't be blank"
    end

    # Needs rewrite for new tag system
    xit "can be tagged" do
      tag = FactoryGirl.create(:tag)
      visit new_innovation_path

      fill_in "Title", with: "My New Valid Innovation"
      fill_in "Abstract", with: "This is my Innovation" * 10
      fill_in "Body", with: "Here is a detailed description of my Innovation" * 30
      check "innovation_consented"
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

    it "does not show hidden innovations" do
      innovation = FactoryGirl.create(:innovation, hidden: true)

      visit innovations_path

      expect(page).not_to have_link innovation.title
    end
  end

  feature "hidden page" do
    it "is shown instead of the Innovation page when hidden" do
      innovation = FactoryGirl.create(:innovation, hidden: true)

      visit innovation_path(innovation)

      expect(page).to have_content "This innovation is currently under review"
    end
  end
end
