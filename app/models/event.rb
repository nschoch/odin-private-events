class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :attendeed_event_id
  has_many :attendees, through: :invitations
  default_scope -> { order(start_date: :asc) }

  validates :start_date, presence: true
  validates :description, presence: true
  validates :creator_id, presence: true
end
