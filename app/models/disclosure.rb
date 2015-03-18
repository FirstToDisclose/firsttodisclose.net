class Disclosure < ActiveRecord::Base
  has_many :disclosure_tags
  has_many :tags, through: :disclosure_tags

  def create_tags(params)
    params.each do |tag|
      self.disclosure_tags.create(tag_id: tag[1])
    end
    self.disclosure_tags.all? { |tag| tag.save }
  end
end
