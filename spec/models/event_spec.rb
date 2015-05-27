require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "attributes" do
    it { should respond_to :title }
    it { should respond_to :start_time }
    it { should respond_to :end_time }
    it { should respond_to :street_1 }
    it { should respond_to :street_2 }
    it { should respond_to :city }
    it { should respond_to :state }
    it { should respond_to :country }
    it { should respond_to :postal_code }
    it { should respond_to :longitude }
    it { should respond_to :latitude }
  end

  describe "associations" do
    it { should have_many :collections }
    it { should have_many :innovations }
    it { should belong_to :user }
  end
end
