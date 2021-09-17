require 'rails_helper'

RSpec.describe User, type: :model do
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

  describe ".country_users" do
    it "scope which returns users related to certain country" do
      expect(User.country_users('Cameroon').all.size).to eq(100)
      expect(User.country_users('Uganda').all.size).to eq(20)
    end
  end

  describe ".country_users_count" do
    it "scope which return hash where the key is country name and the value is number of users" do
      expect(User.country_users_count['Cameroon']).to eq(100)
      expect(User.country_users_count['Uganda']).to eq(20)
      expect(User.country_users_count.keys.size).to eq(2)
    end
  end
end
