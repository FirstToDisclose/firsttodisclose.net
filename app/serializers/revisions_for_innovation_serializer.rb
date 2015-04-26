class RevisionsForInnovationSerializer < ActiveModel::Serializer
  attributes :id, :title, :abstract, :body, :consented, :user_id, :created_at, :updated_at
end
