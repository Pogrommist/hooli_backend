class CreateTradingStrategiesStepBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :trading_strategies_step_buys do |t|
      t.integer :step_index, null: false
      t.string :step_type
      t.float :step_limit, default: 0.0
      t.float :step_limit_percent, default: 0.0
      t.integer :status, null: false
      t.string :step_name
      t.string :step_description

      t.timestamps
    end
  end
end


