require "rails_helper"

describe DisclosureTag do
  describe "attributes" do
    it { should respond_to :disclosure_id }
    it { should respond_to :tag_id }
  end

  describe "validations" do
  end

  describe "associations" do
    it { should belong_to :disclosure }
    it { should belong_to :tag }
  end
end
