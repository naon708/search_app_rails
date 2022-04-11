require 'rails_helper'

RSpec.describe "Api/V1/Steps", type: :request do
  describe "GET /api/v1/steps" do
    it "works!" do
      step = create(:step)
      get api_v1_steps_path
      expect(response).to have_http_status(200)
    end

    it "return the contents of step" do
      create(:step)
      get api_v1_steps_path
      step = JSON.parse(response.body).first
      expect(step["japanese_notation"]).to eq('アラセゴン')
      expect(step["universal_notation"]).to eq('à la seconde')
    end
  end
end
