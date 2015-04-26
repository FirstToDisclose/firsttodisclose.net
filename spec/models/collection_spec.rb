require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe "attributes" do
    it { should respond_to :title }
  end

  describe "associations" do
    it { should have_many :innovations }
    it { should have_many :collection_innovations }
    it { should have_one :event }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_most(250) }
  end
end
