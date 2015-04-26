class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id

  has_many :innovations, through: :collection_innovations
end
