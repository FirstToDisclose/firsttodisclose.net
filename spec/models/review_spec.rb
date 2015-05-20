require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "attributes" do
    it { should respond_to :novelty_rating }
    it { should respond_to :usability_rating }
    it { should respond_to :value_rating }
    it { should respond_to :fourth_rating }
    it { should respond_to :fifth_rating }
    it { should respond_to :content }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :innovation }
  end

  describe "validations" do
    it { should validate_presence_of :novelty_rating }
    it { should validate_numericality_of :novelty_rating }
    it { should validate_inclusion_of(:novelty_rating).in_array([1, 2, 3, 4, 5])}
    it { should validate_presence_of :usability_rating }
    it { should validate_numericality_of :usability_rating }
    it { should validate_inclusion_of(:usability_rating).in_array([1, 2, 3, 4, 5])}
    it { should validate_presence_of :value_rating }
    it { should validate_numericality_of :value_rating }
    it { should validate_inclusion_of(:value_rating).in_array([1, 2, 3, 4, 5])}
    it { should validate_presence_of :fourth_rating }
    it { should validate_numericality_of :fourth_rating }
    it { should validate_inclusion_of(:fourth_rating).in_array([1, 2, 3, 4, 5])}
    it { should validate_presence_of :fifth_rating }
    it { should validate_numericality_of :fifth_rating }
    it { should validate_inclusion_of(:fifth_rating).in_array([1, 2, 3, 4, 5])}
    it { should validate_length_of(:content).is_at_most(10_000) }
  end
end
