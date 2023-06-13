class Workout < ApplicationRecord
  belongs_to :dashboard
  has_and_belongs_to_many :member
end
