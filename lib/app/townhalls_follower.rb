# require 'rubygems'
# require 'oauth'
# require 'json'
require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'twitter'


Dotenv.load


class TownhallsFollower
	#Création d'une variable constante qui récupèrera les handle
	# HANDLE = hash_townhalls[KEY][2]

	TESTING = ["@o0SamArts0o"]
	#Définition de la méthode set_keys, pour la synchronisation avec l'API
	attr_accessor :client, :client2
	def initialize

		@client = Twitter::REST::Client.new do |config|
  			config.consumer_key        = ENV["client_api_key"]
  			config.consumer_secret     = ENV["client_api_secret"]
  			config.access_token        = ENV["acces_token"]
  			config.access_token_secret = ENV["access_token_secret"]
  		end
  		@client2 = Twitter::Streaming::Client.new do |config|
  			config.consumer_key        = ENV["client_api_key"]
  			config.consumer_secret     = ENV["client_api_secret"]
  			config.access_token        = ENV["acces_token"]
  			config.access_token_secret = ENV["access_token_secret"]
  		end
  		# p client
	end

	def find_handle
		topics = ["montpellier"]
		@client2.filter(track: topics.join(",")) do |object|
 		puts object.text if object.is_a?(Twitter::Tweet)
end
	end

	# def send_twitt(hashs)

	# 	i = 0
	# 	hashs.each do |townhall_name, townhall_array|
	# 		i += 1
	# 		handle = townhall_array[2]
	# 		@client.update("#{handle} THP est une formation enrichissante !!")
	# 		if i == 3
	# 			break
	# 		end
	# 	end
	# end

end

testing = TownhallsFollower.new
testing.find_handle
