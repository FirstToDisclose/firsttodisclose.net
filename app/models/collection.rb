class Collection < ActiveRecord::Base
  has_many :collection_innovations
  has_many :innovations, through: :collection_innovations
  has_many :event_collections
  has_many :events, through: :event_collections
  belongs_to :user

  validates :title, presence: true, length: { maximum: 250 }

  def available_innovations
    Innovation.all.select { |i| !i.belongs_to_collection?(self) }
  end
end
