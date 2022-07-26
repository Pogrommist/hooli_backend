Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  resource :users, only: [:show] do
    post :upload_avatar
  end

  resource :users, only: [:show] do
    post :update_user_info
  end

  resource :binances do
    get :get_pairs_by_token
    get :get_klines_for_period
  end

  resources :trading_strategies, only: [:index, :create, :show, :update, :destroy]

  resources :base_trading_strategies_step_items, only: [:create, :show, :update, :destroy]

  resources :trading_strategies_steps_buys, only: [:create, :show, :update, :destroy]
end
