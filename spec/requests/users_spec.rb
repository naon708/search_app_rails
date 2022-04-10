require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  let(:correct_params) { { name: 'foofoo', password: 'password', password_confirmation: 'password' } }
  let(:json_response) { JSON.parse(response.body) }

  describe "POST /api/v1/register" do
    it "successful with correct params" do
      post api_v1_register_path, params: correct_params
      expect(json_response["status"]).to eq(200)
      expect(json_response["user"]["name"]).to eq(correct_params[:name])
    end

    it "failure with incorrect params" do
      post api_v1_register_path
      expect(json_response["status"]).to eq(401)
      expect(json_response).to include('error')
    end
  end

  describe "GET /api/v1/user" do
    let!(:user) { create(:user) }
    let(:payload) { { user_id: user.id } }
    let(:secret_key) { Rails.application.credentials.secret_key_base }
    let(:algorithm) { 'HS256' }
    let(:token) { JWT.encode payload, secret_key, algorithm }
    let(:headers) { { 'Authorization' => "Bearer #{token}" } }

    it "successful with correct token" do
      get api_v1_user_path, headers: headers
      expect(json_response["user"]["name"]).to eq(user.name)
    end

    it "error occur with tampered tokens" do
      expect {
        get api_v1_user_path, headers: { 'Authorization' => "Bearer tampered" }
      }.to raise_error(JWT::DecodeError)
    end
  end
end
