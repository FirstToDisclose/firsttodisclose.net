require 'rails_helper'

RSpec.describe Revision, type: :model do
  describe "attributes" do
    it { should respond_to :innovation_id }
    it { should respond_to :user_id }
    it { should respond_to :title }
    it { should respond_to :abstract }
    it { should respond_to :body }
    it { should respond_to :consented }
  end

  describe "associations" do
    it { should belong_to :innovation }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_least(10) }
    it { should validate_length_of(:title).is_at_most(200) }
    it { should validate_presence_of :body }
    it { should validate_length_of(:body).is_at_least(140) }
    it { should validate_length_of(:body).is_at_most(10_000) }
    it { should validate_presence_of :abstract }
    it { should validate_length_of(:abstract).is_at_least(140) }
    it { should validate_length_of(:abstract).is_at_most(1000) }
    it { should validate_presence_of :consented }
  end
end
