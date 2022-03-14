class Dancer < ApplicationRecord
  with_options uniqueness: true do
    validates :japanese_notation, presence: true
    validates :universal_notation, presence: true
    validates :russian_notation
    validates :name_order, presence: true
  end
end
