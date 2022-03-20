class Api::V1::SearchesController < ApplicationController
  require 'google/apis/youtube_v3'

  def index
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = Rails.application.credentials.google[:youtube_api_key]

    # 検索結果を取得
    search_results = youtube.list_searches(
      :snippet,
      type: "video",
      q: params[:q],
      max_results: 5,
      video_embeddable: true,
      fields: 'items(id(videoId), snippet(title, description, thumbnails(medium(url))))'
    )
    # binding.irb
    @response = []

    search_results.items.each_with_index do |item, index|
      video_id = search_results.items[index].id.video_id
      # 動画それぞれの再生回数を取得
      video_results = youtube.list_videos(
        :statistics,
        id: video_id,
        max_results: 1,
        fields: 'items(statistics(view_count))'
      )
      view_count = video_results.items[0].statistics.view_count

      snippet = item.snippet
      thumbnail_url = snippet.thumbnails.medium.url
      # < 動画タイトル・概要・サムネ・再生回数 > を返す
      @response << { video_id: video_id, title: snippet.title, description: snippet.description, thumbnail: thumbnail_url, view_count: view_count }
    end

    render json: @response
  end
end
