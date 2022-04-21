require 'rails_helper'

RSpec.describe "Api/V1/Dancers", type: :request do
  describe "GET /api/v1/dancers" do
    it "works!" do
      dancer = create(:dancer)
      get api_v1_dancers_path
      expect(response).to have_http_status(200)
    end

    it "return the contents of dancer" do
      create(:dancer)
      get api_v1_dancers_path
      dancer = JSON.parse(response.body).first
      expect(dancer["japanese_notation"]).to eq('アダム・クーパー')
      expect(dancer["universal_notation"]).to eq('Adam Cooper')
      expect(dancer["name_order"]).to eq('アダムクーパー')
    end
  end
end
