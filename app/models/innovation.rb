class Innovation < ActiveRecord::Base
  has_many :innovation_tags
  has_many :tags, through: :innovation_tags

  belongs_to :collection

  validates :title, presence: true, uniqueness: true, length: { minimum: 20, maximum: 200 }
  validates :abstract, presence: true, length: { minimum: 200, maximum: 1000 }
  validates :body, presence: true, length: { minimum: 250, maximum: 10_000 }
  validates :consented, presence: true

  def create_tags(params)
    tags = params[:innovation][:innovation_tags].split(",")
    # Create tag and Innovation tag
    tags.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      innovation_tag = InnovationTag.create(tag: tag, innovation: self)
      if !tag.save || !innovation_tag.save
        return false
      end
    end
    true
  end
end
