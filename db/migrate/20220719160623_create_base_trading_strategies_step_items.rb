class CreateBaseTradingStrategiesStepItems < ActiveRecord::Migration[5.2]
  def change
    create_table :base_trading_strategies_step_items do |t|
      t.references :strategy_item, polymorphic: true, index: { name: :index_strategy_item_on_id_and_type}
      t.references :trading_strategy, index: true

      t.timestamps
    end

  end
end

