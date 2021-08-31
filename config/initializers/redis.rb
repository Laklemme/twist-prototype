# Valerie file
url = ENV.fetch("REDISLCOUD_URL")
$redis = Redis.new(url: url)
