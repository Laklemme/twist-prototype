# Valerie file
# ⚠️ keep { localhost } for development
url = ENV.fetch("REDIS_URL") { "redis://localhost:6379/0" }
$redis = Redis.new(url: url)
