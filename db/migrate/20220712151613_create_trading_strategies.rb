class CreateTradingStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :trading_strategies do |t|
      t.references :user, index: true
      t.boolean :is_running, default: false
      t.string :name
      t.boolean :is_public, default: false
      t.string :integration_with
      t.float :daily_limit, default: 0.0
      t.float :strategy_limit, default: 0.0
      t.string :strategy_currency
      t.string :strategy_token_in
      t.string :strategy_token_out

      t.timestamps
    end
  end
end