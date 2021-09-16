Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :v1, path: "(/:version)", constraints: { version: /v1(.\d)?/ } do
    resource :users do
      collection do
        get :country_users
        get :country_users_count
      end
    end
  end
end
