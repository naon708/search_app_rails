class Api::V1::SearchResultsController < ApplicationController
  include YoutubeApi

  def index
    @saved_search_results = SearchResult.where(search_word: params[:q])
    @response = []

    if @saved_search_results.present? && @saved_search_results.first.recently?
      return_from_database
      return render json: @response
    end

    if @saved_search_results.present? && !@saved_search_results.first.recently?
      begin
        get_search_results(params[:q])
        update_search_results(@youtube_api_response, @saved_search_results)
        @response = @youtube_api_response
      rescue
        return_from_database
      end
    else
      begin
        get_search_results(params[:q])
        save_search_results(@youtube_api_response, params[:q])
        @response = @youtube_api_response
      rescue
        @response = { error: ResourceNotFound }
      end
    end

    render json: @response
  end

  private

  def return_from_database
    @saved_search_results.each do |result|
      @response << { video_id: result.video_id, title: result.title, description: result.description, thumbnail: result.thumbnail, view_count: result.view_count }
    end
  end
end
