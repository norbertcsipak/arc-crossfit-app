class Dashboard < ApplicationRecord
  has_many :workouts
  has_many :members
end
