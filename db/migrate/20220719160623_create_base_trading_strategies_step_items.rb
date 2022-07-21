class CreateBaseTradingStrategiesStepItems < ActiveRecord::Migration[5.2]
  def change
    create_table :base_trading_strategies_step_items do |t|
      t.references :strategy_item, polymorphic: true
      t.references :trading_strategy, index: true

      t.timestamps
    end
  end
end

