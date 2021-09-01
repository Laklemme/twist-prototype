# Valerie file
# ⚠️ keep { localhost } for development
if Rails.env == 'development'
  url = ENV.fetch("REDIS_URL") { "redis://localhost:6379/0" }
else
  url = ENV.fetch("REDISCLOUD_URL")
end

$redis = Redis.new(url: url)
