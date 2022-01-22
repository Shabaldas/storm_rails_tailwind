require 'rails_helper'

RSpec.describe "Shops", type: :request do
  describe "GET /shop" do
    it "returns http success" do
      get "/shops/shop"
      expect(response).to have_http_status(:success)
    end
  end

end
