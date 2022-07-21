class TradingStrategiesStepBuy < ApplicationRecord
  has_many: :base_trading_strategies_step_items, as: :strategy_item
end
