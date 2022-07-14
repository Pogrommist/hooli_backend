class TradingStrategiesController < ApplicationController
  before_action :authenticate_user!

  def index 
    @trading_strategy = current_user.trading_strategies

    render json: @trading_strategy
  end

  def create
    @trading_strategy = current_user.trading_strategies.create(trading_strategy_params)

    render json: @trading_strategy
  end
  
  def show 
    @trading_strategy = current_user.trading_strategies.find_by(id: params[:id])

    render json: @trading_strategy
  end

  def update
    @trading_strategy = current_user.trading_strategies.find_by(id: params[:id])&.update(trading_strategy_params)

    render json: @trading_strategy
  end

  def destroy
    @trading_strategy = current_user.trading_strategies.find_by(id: params[:id])

    render json: @trading_strategy
  end

  private 
  
  def trading_strategy_params
    params.require(:trading_strategy).permit(:is_running, :name, :is_public, :integration_with, :daily_limit, :strategy_limit, :strategy_currency,
    :strategy_token_in, :strategy_token_out)
  end
end