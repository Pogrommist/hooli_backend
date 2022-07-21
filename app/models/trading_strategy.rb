class TradingStrategy < ApplicationRecord
  belongs_to :user
  has_many :base_trading_strategies_step_items
  has_many :trading_strategies_step_buys, through: :base_trading_strategies_step_items, source: :strategy_item, source_type: 'TradingStrategiesStepBuy'
end
