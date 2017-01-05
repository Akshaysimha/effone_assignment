class Event < ApplicationRecord
  validates :event_id, uniqueness: true
end
