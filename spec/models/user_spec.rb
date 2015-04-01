require 'rails_helper'

RSpec.describe User, type: :model do

  pending "attributes" do
    it { should respond_to :name }
  end

  pending "validations" do
    it { should validate_presence_of :name }
  end

  describe "associations" do
    xit { should have_many :innovation_tags }
    xit { should have_many :innovations }
    it { should have_many :reviews }
  end

end
