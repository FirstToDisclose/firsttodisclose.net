class TagSet < ActiveRecord::Base
  has_many :innovation_tags

  scope :official, -> { where(title: "FirstToDisclose") }
  scope :community, -> { where(title: "Community") }

  def community?
    title == "Community"
  end

  def official?
    title == "FirstToDisclose"
  end
end
