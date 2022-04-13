class Variation < ApplicationRecord
  belongs_to :variation_program
  has_many :mark_variations

  validates :title, presence: true, uniqueness: true
  validates :japanese_notation, presence: true, uniqueness: true
  validates :japanese_notation, presence: true, uniqueness: true
end
