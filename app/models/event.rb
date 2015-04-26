class Event < ActiveRecord::Base
  belongs_to :collection

  delegate :title, to: :collection
end
