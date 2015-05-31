require 'rails_helper'

RSpec.describe Teammate, type: :model do
  describe "attributes" do
    it { should respond_to :approved }
  end

  describe "associations" do
    it { should belong_to :team }
    it { should belong_to :user }
  end
end
