require "rails_helper"

describe InnovationTag do
  describe "attributes" do
    it { should respond_to :innovation_id }
    it { should respond_to :tag_id }
  end

  describe "validations" do
  end

  describe "associations" do
    it { should belong_to :innovation }
    it { should belong_to :tag }
    it { should belong_to :tag_set }
    it { should belong_to :user }
  end
end
