class Dancer < ApplicationRecord
  has_many :mark_dancers

  with_options uniqueness: true do
    validates :japanese_notation
    validates :universal_notation, presence: true
    validates :name_order, presence: true
  end

  scope :contain, ->(word) { where('title LIKE ?', "%#{word}%") }

  def self.search(search_query)
    dancers = Dancer.all
    words = search_query.present? ? search_query.split(/[[:blank:]]+/) : []

    words.each do |word|
      dancers = dancers.contain(word)
    end
    dancers
  end
end
