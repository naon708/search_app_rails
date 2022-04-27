class Dancer < ApplicationRecord
  has_many :mark_dancers

  with_options uniqueness: true do
    validates :japanese_notation
    validates :universal_notation, presence: true
    # validates :russian_notation
    validates :name_order, presence: true
  end
end
