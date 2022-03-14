class Step < ApplicationRecord
  validates :japanese_notation, presence: true, uniqueness: true
  validates :universal_notation, presence: true, uniqueness: true
end
