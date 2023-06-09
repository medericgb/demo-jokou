require 'rails_helper'

RSpec.describe "Bids", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/bids/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/bids/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/bids/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/bids/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/bids/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
