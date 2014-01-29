#require 'bundler'
require "sinatra"
require 'twitter'
require 'sinatra/bootstrap' 

set :server, 'webrick'
register Sinatra::Bootstrap::Assets 
#bundler.require

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "cQVZeos4bAmXTb5HnPROlw"
  config.consumer_secret     = "UMBZ2ds0lSTKyLygddiPXlxqXGSxOyostSPSfsP2KI"
  config.access_token        = "182766751-w2eWOZnSGZrAkLo0fVp7in69QiaDgGcPCmdwOhOJ"
  config.access_token_secret = "Wo7OIxEsUl5Hu9omCBTRPOu2LDFmbWVyd0Wopqti4deFc"
end

get '/' do
	@tweets = client.search(params[:query])
	erb :index
end