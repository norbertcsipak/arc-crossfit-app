class Dashboard < ApplicationRecord
  has_many :workouts
  # has_many :members
  belongs_to :member

  # validates :member, presence: true
  # validates :dashboard_id, presence: true
end
