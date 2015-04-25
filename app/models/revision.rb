class Revision < ActiveRecord::Base
  belongs_to :user
  belongs_to :innovation

  validates :title, presence: true, uniqueness: true, length: { minimum: 20, maximum: 200 }
  validates :abstract, presence: true, length: { minimum: 200, maximum: 1000 }
  validates :body, presence: true, length: { minimum: 250, maximum: 10_000 }
  validates :consented, presence: true
end
