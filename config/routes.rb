Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  resource :users, only: [:show] do
    post :upload_avatar
  end

  resource :binances do
    get :get_pairs_by_token
    get :get_klines_for_period
  end
end
