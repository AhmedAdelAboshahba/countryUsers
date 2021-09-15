class User < ApplicationRecord
  belongs_to :country
  after_create -> { update_country_count(country.users_count + 1) }
  before_destroy -> { update_country_count(country.users_count - 1) }

  def update_country_count(count)
    country.update(users_count: count)
  end
end
