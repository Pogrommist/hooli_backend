class BaseTradingStrategiesStepItemsController < ApplicationController
		before_action :authenticate_user!

  def create 
    # To do: create service that will tell us which type of strategy steps to use
    @base_trading_strategies_step_item = current_user.trading_strategies.find_by(id: params[:id])&.base_trading_strategies_step_items.create(base_trading_strategies_step_item_params)

    render json: @base_trading_strategies_step_item
  end
  
  def show 
    @base_trading_strategies_step_item = current_user.trading_strategies.base_trading_strategies_step_items.find_by(id: params[:id])

    render json: @base_trading_strategies_step_item
  end

  def update
    # To do: create service that will tell us which type of strategy steps to use
    @base_trading_strategies_step_item = current_user.trading_strategy.base_trading_strategies_step_items.find_by(id: params[:id])&.update(base_trading_strategies_step_item_params)

    render json: @base_trading_strategies_step_item
  end

  def destroy
    # To do: create service that will tell us which type of strategy steps to use
    @base_trading_strategies_step_item = current_user.trading_strategy.base_trading_strategies_step_items.find_by(id: params[:id])&.destroy

    render json: @base_trading_strategies_step_item
  end

  private 
  
  def base_trading_strategies_step_item_params
    params.require(:strategy_step).permit(:strategy_item, :trading_strategy)
  end
end

