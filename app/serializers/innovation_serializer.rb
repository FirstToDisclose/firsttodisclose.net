class InnovationSerializer < ActiveModel::Serializer
  attributes :id, :title, :abstract, :body, :consented, :user_id, :novelty_score, :value_score, :usability_score, :tooling_score, :lifespan_score

  has_many :tags, through: :innovation_tags
  has_many :collections, through: :collection_innovations, serializer: CollectionsForInnovationSerializer
  has_many :reviews
  has_many :revisions
end
