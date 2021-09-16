class V1::UsersController < ApplicationController
  def country_users
    users = User.country_users(params[:country]).order(:id).paginate(page: page, per_page: per_page)
    if users.any?
      json_response(UserSerializer.new(users).serializable_hash, :ok, nil, users.total_pages, users.total_entries)
    else
      json_response(nil, :not_found, "No users found with country = #{params[:country]}")
    end
  end

  def country_users_count
    json_response({ data: User.country_users_count }, :ok)
  end
end
