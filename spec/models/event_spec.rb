require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "attributes" do
    it { should respond_to :start_time }
    it { should respond_to :end_time }
    it { should respond_to :collection_id }
    it { should respond_to :title }
  end

  describe "associations" do
    it { should belong_to :collection }
  end

  describe "validations" do
  end
end
