FactoryBot.define do
  factory :search_result do
    search_word { '検索ワード' }
    video_id { 'sample' }
    title { 'タイトル' }
    description { '概要' }
    thumbnail { 'サムネイル' }
    view_count { 1000 }
  end
end
