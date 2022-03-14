class Variation < ApplicationRecord
  belongs_to :variation_program

  validates :title, presence: true, uniqueness: true
  validates :japanese_notation, presence: true, uniqueness: true
  validates :japanese_notation, presence: true, uniqueness: true
end
