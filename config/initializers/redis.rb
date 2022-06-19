unless ARGV.include? "assets:precompile"
  pool = ENV['REDIS_CONNECTION_POOL'].to_i
  url = ENV['REDISTOGO_URL'] || 'redis://localhost:6379'
  timeout = ENV['REDIS_CONNECTION_POOL_TIMEOUT'].to_i
  $redis = ConnectionPool.new(size: pool, timeout: timeout) { Redis.new(url: url) }
end