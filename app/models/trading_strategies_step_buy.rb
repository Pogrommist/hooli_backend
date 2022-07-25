class TradingStrategiesStepBuy < ApplicationRecord
  has_many :base_trading_strategies_step_items, as: :strategy_item

  enum status: { completed: 10, not_completed: 20, running: 30 }
end
