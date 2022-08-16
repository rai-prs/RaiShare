class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :room_start_date, presence: true
  validates :room_end_date, presence: true
  validates :room_number, presence: true, numericality: true
end
