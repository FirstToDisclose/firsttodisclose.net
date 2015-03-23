require "rails_helper"

describe Tag do
  describe "attributes" do
    it { should respond_to :name }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe "associations" do
    it { should have_many :disclosure_tags }
    it { should have_many :disclosures }
  end
end
