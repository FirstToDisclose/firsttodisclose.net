class EventCollection < ActiveRecord::Base
  belongs_to :event
  belongs_to :collection
end
