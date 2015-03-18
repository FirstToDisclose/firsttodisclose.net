class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :disclosure_tags
  has_many :disclosures, through: :disclosure_tags
end
