require 'rails_helper'

RSpec.describe User, type: :model do

  describe "attributes" do
    it { should respond_to :name }
  end

  describe "validations" do
  end

  describe "associations" do
    xit { should have_many :innovation_tags }
    it { should have_many :innovations }
    it { should have_many :reviews }
    it { should have_many :collections }
    it { should have_many :revisions }
    it { should have_many :events }
    it { should have_many :teammates }
  end

end
