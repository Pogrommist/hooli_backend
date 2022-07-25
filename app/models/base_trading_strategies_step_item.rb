class BaseTradingStrategiesStepItem < ApplicationRecord
  belongs_to :trading_strategy
  belongs_to :strategy_item, polymorphic: true
end
