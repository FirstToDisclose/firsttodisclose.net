class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :innovation

  validates :novelty_rating, presence: true,
                             numericality: true,
                             inclusion: { in: [1, 2, 3, 4, 5] }
  validates :usability_rating, presence: true,
                             numericality: true,
                             inclusion: { in: [1, 2, 3, 4, 5] }
  validates :value_rating, presence: true,
                             numericality: true,
                             inclusion: { in: [1, 2, 3, 4, 5] }
  validates :fourth_rating, presence: true,
                             numericality: true,
                             inclusion: { in: [1, 2, 3, 4, 5] }
  validates :fifth_rating, presence: true,
                             numericality: true,
                             inclusion: { in: [1, 2, 3, 4, 5] }
  validates :content, length: { maximum: 10_000 }
end
