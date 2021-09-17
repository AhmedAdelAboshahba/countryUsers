require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do
    counter = 0
    for i in 0 ... 100 do
      User.create(email: "ahmed+#{counter}@gmail.com", country: "Cameroon")
      counter += 1
    end
    for i in 0 ... 20 do
      User.create(email: "ahmed+#{counter}@gmail.com", country: "Uganda")
      counter += 1
    end
  end

  describe "GET /country_users" do
    it "get users related to certain country" do
      get "/users/country_users", :params => 'country=Cameroon&page=1'
      expect(JSON.parse(response.body)['data'].size).to eq(10)
      expect(response).to have_http_status(:ok)
    end  

    it "search for users of not found country" do
      get "/users/country_users", :params => 'country=Egypt&page=1'
      expect(response).to have_http_status(:not_found)
    end 
  end

  describe "GET /country_users_count" do
    it "get number of users in each country" do
      get "/users/country_users_count"
      response_hash = JSON.parse(response.body)['data']
      expect(response).to have_http_status(:ok)
      expect(response_hash.size).to eq(2)
      expect(response_hash['Cameroon']).to eq(100)
      expect(response_hash['Uganda']).to eq(20)
    end 
  end
end
