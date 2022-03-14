class VariationProgram < ApplicationRecord
  has_many :variations

  validates :name, presence: true, uniqueness: true
end
