require 'rails_helper'

RSpec.describe EventMembership, type: :model do
  describe "attributes" do
    it { should respond_to :approved }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :event }
  end
end
