class VariationProgram < ApplicationRecord
  has_many :variations

  validates :name, presence: true, uniqueness: true

  scope :contain, ->(word) { where('name LIKE ?', "%#{word}%") }

  def self.search(search_query)
    variations = VariationProgram.all
    words = search_query.present? ? search_query.split(/[[:blank:]]+/) : []

    words.each do |word|
      variations =  if variations.contain(word).present?
                      variations.contain(word).first.variations
                    else
                      variations.contain(word)
                    end
    end
    variations
  end
end
