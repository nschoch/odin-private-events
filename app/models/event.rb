class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  default_scope -> { order(start_date: :asc) }
  validates :start_date, presence: true
  validates :description, presence: true
  validates :creator_id, presence: true
end
