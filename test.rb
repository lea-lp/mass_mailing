# require 'rubygems'
# require 'oauth'
# require 'json'
require 'dotenv'
require 'twitter'


Dotenv.load


# class TownhallsFollower

	# def set_keys
		client = Twitter::REST::Client.new do |config|
  		config.consumer_key        = ENV["client_api_key"]
  		config.consumer_secret     = ENV["client_api_secret"]
  		config.access_token        = ENV["acces_token"]
  		config.access_token_secret = ENV["access_token_secret"]
  		end
#   		p client
# 	end

# 	def hello
# 		puts "Bonjour"
# 	end

# end

# testing = TownhallsFollower.new
# testing.set_keys

client.update("@o0SamArts0o Hello world")