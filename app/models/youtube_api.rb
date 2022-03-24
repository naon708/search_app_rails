module YoutubeApi
  require 'google/apis/youtube_v3'

  def get_search_results(query_string)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:youtube_api_key]
    @youtube_api_response = []

    # 検索結果を取得
    search_results = youtube.list_searches(
      :snippet,
      type: "video",
      q: query_string,
      max_results: 25,
      video_embeddable: true,
      fields: 'items(id(videoId), snippet(title, description, thumbnails(medium(url))))'
    )

    search_results.items.each_with_index do |item, index|
      video_id = search_results.items[index].id.video_id
      # 各動画の再生回数を取得（list_searchesメソッドでは再生回数を取得できないため）
      video_results = youtube.list_videos(
        :statistics,
        id: video_id,
        max_results: 1,
        fields: 'items(statistics(view_count))'
      )

      view_count = video_results.items[0].statistics.view_count
      snippet = item.snippet
      thumbnail = snippet.thumbnails.medium.url
      # { video_id・動画タイトル・概要・サムネ・再生回数 } を返す
      @youtube_api_response << { video_id: video_id, title: snippet.title, description: snippet.description, thumbnail: thumbnail, view_count: view_count }
      @youtube_api_response
    end
  end

  def save_search_results(results, query_string)
    results.each do |result|
      SearchResult.create!(
        search_word: query_string,
        video_id: result[:video_id],
        title: result[:title],
        description: result[:description],
        thumbnail: result[:thumbnail],
        view_count: result[:view_count],
      )
    end
  end

  def update_search_results(latest_results, past_results)
    past_results.each_with_index do |result, index|
      result.update!(
        video_id: latest_results[index][:video_id],
        title: latest_results[index][:title],
        description: latest_results[index][:description],
        thumbnail: latest_results[index][:thumbnail],
        view_count: latest_results[index][:view_count],
        updated_at: Time.current
      )
    end
  end
end
