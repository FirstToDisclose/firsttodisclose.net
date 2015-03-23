class DisclosureSerializer < ActiveModel::Serializer
  attributes :title, :abstract, :body, :consented

  has_many :tags, through: :disclosure_tags
end
