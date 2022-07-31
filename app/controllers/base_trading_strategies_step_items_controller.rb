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
    strategy = current_user.trading_strategies.find_by(id: params[:strategy_id])
    step_service = StrategyService::StrategyStepsService::StrategyStepGetter.new(strategy, params)
    step_model = step_service.get_step_object
    step_params = step_service.permit_step_params
    step = step_model

    render json: step || {}
  end

  def update
    strategy = current_user.trading_strategies.find_by(id: params[:strategy_id])
    step_service = StrategyService::StrategyStepsService::StrategyStepGetter.new(strategy, params)
    step_model = step_service.get_step_object
    step_params = step_service.permit_step_params
    step = step_model&.update(step_params)

    render json: step || {}
  end

  def destroy
    strategy = current_user.trading_strategies.find_by(id: params[:strategy_id])
    step_service = StrategyService::StrategyStepsService::StrategyStepGetter.new(strategy, params)
    step_model = step_service.get_step_object
    step_params = step_service.permit_step_params
    step = step_model&.destroy(step_params)

    render json: step || {}
  end
end

