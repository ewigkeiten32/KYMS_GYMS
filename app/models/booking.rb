class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trainer

  validates :start_time, :end_time, presence: true
  validate :end_time_after_start_time
end

private

def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start date")
    end
 end
