class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations
  default_scope -> { order(start_date: :asc) }
  scope :upcoming, -> { where('start_date >= :today', {today: Time.now.to_date})}
  scope :past, -> { where('start_date < :today', {today: Time.now.to_date})}
  validates :start_date, presence: true
  validates :description, presence: true
  validates :creator_id, presence: true
end
