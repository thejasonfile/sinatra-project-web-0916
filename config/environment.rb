require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

client = Yelp.client.configure do |config|
  config.consumer_key = 'tDim-oA5sggT_lV1shpe8g'
  config.consumer_secret = 'fxHaI-QTjueMgfrede8x3SFmm5Y'
  config.token = 'yugpiz4g7pXYPUekjlCtG1CUC_cvbVWr'
  config.token_secret = 'abai6D7EY6SB8lfsvVgIdqRfhX4'
end
