class Disclosure < ActiveRecord::Base
  has_many :disclosure_tags
  has_many :tags, through: :disclosure_tags

  validates :title, presence: true, uniqueness: true, length: { minimum: 20, maximum: 200 }
  validates :abstract, presence: true, length: { minimum: 200, maximum: 1000 }
  validates :body, presence: true, length: { minimum: 250, maximum: 10_000 }
  validates :consented, acceptance: true

  def create_tags(params)
    if params
      params.each do |tag|
        self.disclosure_tags.create(tag_id: tag[1])
      end
      self.disclosure_tags.all? { |tag| tag.save }
    else
      true # returns true if there are no tags to save
    end
  end
end
