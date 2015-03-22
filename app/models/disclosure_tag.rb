class DisclosureTag < ActiveRecord::Base
  validates :disclosure_id, presence: true
  validates :tag_id, presence: true

  belongs_to :tag
  belongs_to :disclosure
end
