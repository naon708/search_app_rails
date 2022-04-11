require 'rails_helper'

RSpec.describe "Api/V1/VariationPrograms", type: :request do
  describe "GET /api/v1/variation_programs" do
    it "works!" do
      variation_program = create(:variation_program)
      get api_v1_variation_programs_path
      expect(response).to have_http_status(200)
    end

    it "return the contents of variation_program" do
      create(:variation_program)
      get api_v1_variation_programs_path
      variation_program = JSON.parse(response.body).first
      expect(variation_program["name"]).to eq('白鳥の湖')
    end
  end
end
