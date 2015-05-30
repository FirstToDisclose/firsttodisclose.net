class EventMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  scope :approved, -> {where(approved: true)}
  scope :unapproved, -> {where(approved: false)}
end
