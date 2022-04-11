require 'rails_helper'

RSpec.describe "Api/V1Variations", type: :request do
  let!(:variation_program) { create(:variation_program) }

  describe "GET /api/v1/variations" do
    it "works!" do
      variation = create(:variation)
      get api_v1_variations_path
      expect(response).to have_http_status(200)
    end

    it "return the contents of variation" do
      create(:variation)
      get api_v1_variations_path
      variation = JSON.parse(response.body).first
      expect(variation["variation_program_id"]).to eq(1)
      expect(variation["title"]).to eq('パ・ド･トロワ第1Va / 第1幕より')
      expect(variation["japanese_notation"]).to eq('白鳥の湖 パ・ド・トロワ 第1')
      expect(variation["universal_notation"]).to eq('swan lake pas de trois 2nd')
    end
  end
end
