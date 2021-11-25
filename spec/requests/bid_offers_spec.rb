require 'rails_helper'

RSpec.describe "BidOffers", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/bid_offers/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/bid_offers/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/bid_offers/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/bid_offers/update"
      expect(response).to have_http_status(:success)
    end
  end

end
