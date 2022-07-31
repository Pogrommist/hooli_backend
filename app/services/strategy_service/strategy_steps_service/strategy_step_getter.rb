module StrategyService::StrategyStepsService
  class StrategyStepGetter

    def initialize(strategy, params)
      @strategy = strategy
      @step_type = params.try(:[], :strategy_step).try(:[], :step_type)&.downcase
      @params = params
    end

    def get_step_object
      return unless @strategy

      get_step_type
    end

    def permit_step_params
      case @step_type
        when 'buy' then permit_step_buy_params
        else nil
      end
    end

    private

    def get_step_type
      case @step_type
        when 'buy' then @strategy.trading_strategies_step_buys
        else nil
        end
    end

    def permit_step_buy_params
      @params.require(:strategy_step).permit(:step_index, :step_type, :step_limit, :step_limit_percent, :status, :step_name, :step_description)
    end

  end
end