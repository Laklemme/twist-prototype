# Valerie file
url = ENV.fetch("REDISCLOUD_URL")
$redis = Redis.new(url: url)
