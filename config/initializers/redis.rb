url = ENV['REDISTOGO_URL'] || 'redis://localhost:6379'
$redis = Redis.new(url: url)
