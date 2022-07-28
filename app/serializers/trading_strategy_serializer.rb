class TradingStrategySerializer < ActiveModel::Serializer
	attributes %i(is_running name is_public integration_with daily_limit strategy_limit strategy_currency strategy_token_in strategy_token_out)
  has_many :trading_strategies_step_buys, through: :base_trading_strategies_step_items, source: :strategy_item, source_type: 'TradingStrategiesStepBuy', key: 'steps'
end