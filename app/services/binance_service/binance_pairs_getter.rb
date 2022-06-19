require 'binance'

module BinanceService
  class BinancePairsGetter

    def initialize
    end

    def get_pairs_by(pair_name)
      result = []
      available_symbols
          &.select { |symbol|  symbol[:status] == 'TRADING' && symbol[:baseAsset].downcase == pair_name.downcase }
          &.each { |symbol| result << { baseAsset: symbol[:baseAsset], quoteAsset: symbol[:quoteAsset] } }

      result
    end

    def get_klines_for_period(pair_name, start_time, end_time, interval)
      client.klines_for_period(symbol: pair_name.upcase,
                                interval: interval,
                                start_time: start_time.to_i,
                                end_time: end_time.to_i
      )
    end

    def pairs_with_prices(pair_name)
      available_symbols
          &.select { |symbol|  symbol[:status] == 'TRADING' && symbol[:baseAsset].downcase == pair_name.downcase }
          &.each { |symbol| { baseAsset: symbol[:baseAsset], quoteAsset: symbol[:quoteAsset] } }
          &.group_by {|symbol| symbol[:symbol]}
      symbols = available_symbols&.keys || []

      if symbols.any?
        symbols = client.ticker_prices(symbols: symbols.to_json)
        symbols.each do |symbol|
          source = available_symbols[symbol[:symbol]]&.last
          symbol.merge!(pair_formatted: "#{source[:baseAsset]}/#{source[:quoteAsset]}")
        end
      end
      symbols
    end

    private

    def client
      @client ||= Binance::Spot.new(key: ENV['BINANCE_API_KEY'], secret: ENV['BINANCE_SECRET_KEY'])
    end

    def available_symbols
      symbols =  Rails.cache.fetch('binance_available_symbols', expires_in: 86400) do
        client.exchange_info.try(:[], :symbols)
      end
      symbols
    end

  end
end
