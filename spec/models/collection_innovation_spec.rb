require 'rails_helper'

RSpec.describe CollectionInnovation, type: :model do
  describe "associations" do
    it { should belong_to :collection }
    it { should belong_to :innovation }
  end
end
