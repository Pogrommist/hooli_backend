class BinancesController < ApplicationController

    def get_pairs_by_token
      pairs = BinanceService::BinancePairsGetter.new.get_pairs_by(params[:pair_name])

      render json: pairs
    end

    def get_klines_for_period
      klines = BinanceService::BinancePairsGetter.new.get_klines_for_period(params[:pair_name], params[:start_time], params[:end_time], params[:interval])

      render json: klines
    end
end