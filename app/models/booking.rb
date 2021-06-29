class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trainer

  # validates :user, presence: :true
  # validates :trainer, presence: :true
  validates :start_time, presence: :true
  validates :end_time, presence: :true
end
