class Skill < ApplicationRecord
  validates :name, :level, presence: true 
end
