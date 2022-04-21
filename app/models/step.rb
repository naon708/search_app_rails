class Step < ApplicationRecord
  has_many :mark_steps

  validates :japanese_notation, presence: true, uniqueness: true
  validates :universal_notation, presence: true, uniqueness: true
end
