require 'rails_helper'

RSpec.describe "Api::V1::Programs", type: :request do
  describe "GET /api/v1/programs" do
    it "works!" do
      program = create(:program)
      get api_v1_programs_path
      expect(response).to have_http_status(200)
    end

    it "return the contents of program" do
      create(:program)
      get api_v1_programs_path
      program = JSON.parse(response.body).first
      expect(program["japanese_notation"]).to eq('白鳥の湖')
      expect(program["universal_notation"]).to eq('Swan Lake')
      expect(program["russian_notation"]).to eq('Лебединое озеро')
      expect(program["name_order"]).to eq('はくちょうのみずうみ')
      expect(program["wikipedia_path"]).to eq('白鳥の湖')
    end
  end
end
