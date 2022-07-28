class BaseTradingStrategiesStepItemsController < ApplicationController
  before_action :authenticate_user!

  def create 
    strategy = current_user.trading_strategies.find_by(id: params[:strategy_id])
    step_service = StrategyService::StrategyStepsService::StrategyStepGetter.new(strategy, params)
    step_model = step_service.get_step_object
    step_params = step_service.permit_step_params
    step = step_model&.create(step_params)

    render json: step || {}
  end
  
  def show
    # ToDo: use 'create' method as example and fix next line
    @base_trading_strategies_step_item = current_user.trading_strategies.base_trading_strategies_step_items.find_by(id: params[:id])

    render json: @base_trading_strategies_step_item
  end

  def update
    # ToDo: use 'create' method as example and fix next line
    @base_trading_strategies_step_item = current_user.trading_strategy.base_trading_strategies_step_items.find_by(id: params[:id])&.update(base_trading_strategies_step_item_params)

    render json: @base_trading_strategies_step_item
  end

  def destroy
    # ToDo: use 'create' method as example and fix next line
    @base_trading_strategies_step_item = current_user.trading_strategy.base_trading_strategies_step_items.find_by(id: params[:id])&.destroy

    render json: @base_trading_strategies_step_item
  end

  private 
  
  def base_trading_strategies_step_item_params
    # ToDo: remove that method and use StrategyStepGetter instead
    params.require(:strategy_step).permit(:strategy_item, :trading_strategy)
  end
end

