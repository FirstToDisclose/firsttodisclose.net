require "rails_helper"

describe "LivePages" do
  feature "viewing hangouts" do
    it "should be visible on the live page" do
      innovation = FactoryGirl.create(:innovation)
      hangout = FactoryGirl.create(:live_page)

      visit live_pages_path

      expect(page).to have_xpath("//iframe[@src='#{hangout.hangout_url}']")
    end
  end
end
