require 'rails_helper'

RSpec.describe TagSet, type: :model do
  describe "attributes" do
    it { should respond_to :title }
  end

  describe "associations" do
    it { should have_many :innovation_tags }
  end
end
