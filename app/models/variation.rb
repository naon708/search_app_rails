class Variation < ApplicationRecord
  belongs_to :variation_program
  has_many :mark_variations

  validates :title, presence: true, uniqueness: true
  validates :japanese_notation, presence: true, uniqueness: true
  validates :japanese_notation, presence: true, uniqueness: true

  scope :contain, ->(word) { where('title LIKE ?', "%#{word}%") }
  scope :program_name_contain, ->(word) { joins(:variation_program).where('name LIKE ?', "%#{word}%") }

  def self.search(search_query)
    variations = Variation.all
    words = search_query.present? ? search_query.split(/[[:blank:]]+/) : []

    words.each do |word|
      variations = variations.contain(word)
    end
    variations
  end
end
