class Disclosure < ActiveRecord::Base
  has_many :disclosure_tags
  has_many :tags, through: :disclosure_tags

  validates :title, presence: true, uniqueness: true, length: { minimum: 20, maximum: 200 }
  validates :abstract, presence: true, length: { minimum: 200, maximum: 1000 }
  validates :body, presence: true, length: { minimum: 250, maximum: 10_000 }
  validates :consented, presence: true # presence validaiton used for booleans

  def create_tags(params)
    tags = params[:disclosure][:disclosure_tags].split(",")
    # Create tag and disclosure tag
    tags.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      disclosure_tag = DisclosureTag.create(tag: tag, disclosure: self)
      if !tag.save || !disclosure_tag.save
        return false
      end
    end
    true
  end
end
