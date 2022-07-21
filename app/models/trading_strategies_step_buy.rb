class TradingStrategiesStepBuy < ApplicationRecord
  has_many :base_trading_strategies_step_items, as: :strategy_item

  enum status: { completed: 0, not_completed: 1, running: 2 }
end
