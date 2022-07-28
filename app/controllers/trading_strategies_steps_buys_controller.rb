class TradingStrategiesStepsBuysController < ApplicationController
    before_action :authenticate_user!

  def create
    @trading_strategies_step_buy = current_user.trading_strategies.trading_strategies_steps_buys.create(trading_strategies_step_buy_params)

    render json: @trading_strategies_step_buy
  end
  
  def show 
    @trading_strategies_step_buy = current_user.trading_strategies.trading_strategies_steps_buys.find_by(id: params[:id])

    render json: @trading_strategies_step_buy
  end

  def update
    @trading_strategies_step_buy = current_user.trading_strategies.trading_strategies_steps_buys.find_by(id: params[:id])&.update(trading_strategies_step_buy_params)

    render json: @trading_strategies_step_buy
  end

  def destroy
    @trading_strategies_step_buy = current_user.trading_strategies.trading_strategies_steps_buys.find_by(id: params[:id])&.destroy

    render json: @trading_strategies_step_buy
  end

  private 
  
  def trading_strategies_step_buy_params
    params.require(:trading_strategy_step_buy).permit(:step_index, :step_type, :step_limit, :step_limit_percent, :status, :step_name, :step_description)
  end
end



