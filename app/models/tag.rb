class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :innovation_tags
  has_many :innovations, through: :innovation_tags
end
