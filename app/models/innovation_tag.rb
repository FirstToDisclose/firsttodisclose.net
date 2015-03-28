class InnovationTag < ActiveRecord::Base
  validates :innovation_id, presence: true
  validates :tag_id, presence: true

  belongs_to :tag
  belongs_to :innovation
end
