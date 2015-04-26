class Innovation < ActiveRecord::Base
  has_many :innovation_tags
  has_many :tags, through: :innovation_tags
  has_many :reviews
  has_many :collection_innovations
  has_many :collections, through: :collection_innovations
  has_many :revisions

  belongs_to :user

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

  def belongs_to_collection?(collection)
    collections.include?(collection)
  end

  def has_been_reviewed_by?(user)
    review = Review.find_by(user: user, innovation: self)
    !review.blank?
  end

  def reviewable_by?(user)
    !self.has_been_reviewed_by?(user) && user.reviewer?
  end

  def novelty_score
    reviews.sum(:novelty_rating).to_f / reviews.count
  end

  def value_score
    reviews.sum(:value_rating).to_f / reviews.count
  end

  def usability_score
    reviews.sum(:usability_rating).to_f / reviews.count
  end

  def fourth_score
    reviews.sum(:fourth_rating).to_f / reviews.count
  end

  def fifth_score
    reviews.sum(:fifth_rating).to_f / reviews.count
  end

  def clone
    @revision = Revision.create(title: title,
                             abstract: abstract,
                             body: body,
                             consented: consented,
                             user: user,
                             innovation: self)
  end

  def hidden?
    self.hidden
  end

  def self.visible
    where(hidden: false)
  end
end
