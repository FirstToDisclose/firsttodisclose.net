require "rails_helper"

describe Disclosure do
  describe "attributes" do
    it { should respond_to :title }
    it { should respond_to :body }
    it { should respond_to :abstract }
    it { should respond_to :consented }
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_uniqueness_of :title }
    it { should ensure_length_of(:title).is_at_least(20) }
    it { should ensure_length_of(:title).is_at_most(200) }
    it { should validate_presence_of :body }
    it { should ensure_length_of(:body).is_at_least(250) }
    it { should ensure_length_of(:body).is_at_most(10_000) }
    it { should validate_presence_of :abstract }
    it { should ensure_length_of(:abstract).is_at_least(200) }
    it { should ensure_length_of(:abstract).is_at_most(1000) }
    it { should validate_acceptance_of :consented }
  end

  describe "associations" do
    it { should have_many :disclosure_tags }
    it { should have_many :tags }
  end
end
