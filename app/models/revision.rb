class Revision < ActiveRecord::Base
  belongs_to :user
  belongs_to :innovation

  validates :title, presence: true, length: { minimum: 10, maximum: 200 }
  validates :abstract, presence: true, length: { minimum: 140, maximum: 1000 }
  validates :body, presence: true, length: { minimum: 140, maximum: 10_000 }
  validates :consented, presence: true
end
