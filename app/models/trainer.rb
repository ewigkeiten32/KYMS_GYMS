class Trainer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :discipline, presence: :true, inclusion: { in: %w(crossfit boxing weights) }
  validates :level, presence: :true, inclusion: { in: %w(beginner intermediate advanced) }
  validates :price, presence: :true
  validates :about_me, presence: :true
end
