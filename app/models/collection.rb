class Collection < ActiveRecord::Base
  has_many :collection_innovations
  has_many :innovations, through: :collection_innovations
  belongs_to :user
  belongs_to :event

  validates :title, presence: true, length: { maximum: 250 }

  def available_innovations
    Innovation.all.select { |i| !i.belongs_to_collection?(self) }
  end
end
