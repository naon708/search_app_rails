require 'rails_helper'

RSpec.describe "Api::V1::Sessions", type: :request do
  describe "GET /api/v1/sessions" do
    let(:user) { create(:user) }
    let(:correct_params) { { name: user.name, password: user.password } }
    let(:incorrect_name_params) { { name: "dummyname", password: user.password } }
    let(:incorrect_password_params) { { name: user.name, password: "dummypassword" } }
    let(:json_response) { JSON.parse(response.body) }

    it "successful with correct params" do
      post api_v1_login_path, params: correct_params
      expect(json_response["response"]).to include(200)
      expect(json_response["token"].present?).to be_truthy
    end

    it "failure with incorrect name params" do
      post api_v1_login_path, params: incorrect_name_params
      expect(json_response["status"]).to eq(401)
      expect(json_response["error"]).to eq("UnableAuthorizationError")
    end

    it "failure with incorrect name params" do
      post api_v1_login_path, params: incorrect_password_params
      expect(json_response["status"]).to eq(401)
      expect(json_response["error"]).to eq("UnableAuthorizationError")
    end
  end
end
