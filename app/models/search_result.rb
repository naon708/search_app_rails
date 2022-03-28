class SearchResult < ApplicationRecord
  validates :search_word, presence: true
  validates :video_id, presence: true
  validates :title, presence: true
  validates :thumbnail, presence: true

  # 2週間以内に更新されたものか確認
  def recently?
    updated_at > Time.current.weeks_ago(2)
  end
end
