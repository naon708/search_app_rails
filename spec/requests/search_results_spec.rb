require 'rails_helper'

RSpec.describe "Api/V1/SearchResults", type: :request do
  let(:json_response) { JSON.parse(response.body) }

  describe "GET /api/v1/search_results" do
    it "successful received search results" do
      get api_v1_search_results_path(q: '白鳥の湖')
      required_items = ["video_id", "title", "description", "thumbnail", "view_count"]
      response_properties = json_response.first.keys
      expect(
        required_items.all? { |item| response_properties.include?(item) }
      ).to be_truthy
    end
  end
end
