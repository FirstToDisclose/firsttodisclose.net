class Teammate < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  scope :approved, -> {where(approved: true)}
  scope :unapproved, -> {where(approved: false)}
end
