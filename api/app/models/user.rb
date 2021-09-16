class User < ApplicationRecord
  scope :country_users, -> (country_name) { where(country: country_name) }
  scope :country_users_count, -> { group(:country).count }
end
