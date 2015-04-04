require 'rails_helper'

RSpec.describe Identity, type: :model do
  describe "attributes" do
  end

  describe "validations" do
  end

  describe "associations" do
    it { should belong_to :user }
  end

end
