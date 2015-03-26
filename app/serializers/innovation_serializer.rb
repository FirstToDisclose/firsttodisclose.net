class InnovationSerializer < ActiveModel::Serializer
  attributes :title, :abstract, :body, :consented

  has_many :tags, through: :innovation_tags
end
