class Program < ApplicationRecord
  with_options uniqueness: true do
    validates :japanese_notation
    validates :universal_notation
    validates :russian_notation
    validates :name_order
    validates :wikipedia_path

    with_options presence: true do
      validates :japanese_notation
      validates :universal_notation
      validates :name_order
    end
  end
end
