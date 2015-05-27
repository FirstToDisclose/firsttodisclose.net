require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe "attributes" do
    it { should respond_to :title }
  end

  describe "associations" do
    it { should have_many :innovations }
    it { should have_many :collection_innovations }
    it { should belong_to :user }
    it { should belong_to :event }
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_most(250) }
  end
end
