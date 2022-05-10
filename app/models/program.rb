class Program < ApplicationRecord
  has_many :mark_programs

  with_options uniqueness: true do
    validates :japanese_notation, presence: true
    validates :universal_notation, presence: true
    validates :russian_notation
    validates :name_order, presence: true
    validates :wikipedia_path
  end

  scope :contain, ->(word) { where('japanese_notation LIKE ?', "%#{word}%") }

  def self.search(search_query)
    programs = Program.all
    words = search_query.present? ? search_query.split(/[[:blank:]]+/) : []

    words.each do |word|
      programs = programs.contain(word)
    end
    programs
  end
end
