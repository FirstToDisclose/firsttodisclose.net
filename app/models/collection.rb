class Collection < ActiveRecord::Base
  has_many :innovations
  belongs_to :user

  validates :title, presence: true, length: { maximum: 250 }
end
