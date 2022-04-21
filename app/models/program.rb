class Program < ApplicationRecord
  has_many :mark_programs

  with_options uniqueness: true do
    validates :japanese_notation, presence: true
    validates :universal_notation, presence: true
    validates :russian_notation
    validates :name_order, presence: true
    validates :wikipedia_path
  end
end
