class Step < ApplicationRecord
  has_many :mark_steps

  validates :japanese_notation, presence: true, uniqueness: true
  validates :universal_notation, presence: true, uniqueness: true

  scope :contain, ->(word) { where('japanese_notation LIKE ?', "%#{word}%") }

  def self.search(search_query)
    steps = Step.all
    words = search_query.present? ? search_query.split(/[[:blank:]]+/) : []

    words.each do |word|
      steps = steps.contain(word)
    end
    steps
  end
end
