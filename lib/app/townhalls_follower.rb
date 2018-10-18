require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'twitter'


Dotenv.load

p "#"*20
p ENV["client_api_key"]


class TownhallsFollower
	attr_accessor :client, :names

	TESTING = ["@o0SamArts0o"]

	# Définition de la méthode set_keys, pour la synchronisation avec l'API

	def initialize(townhalls) # Initialisation du serveur

		@client = Twitter::REST::Client.new do |config|
  			config.consumer_key        = ENV["client_api_key"]
  			config.consumer_secret     = ENV["client_api_secret"]
  			config.access_token        = ENV["acces_token"]
  			config.access_token_secret = ENV["access_token_secret"]
  		end
  		@names = townhalls

	end

	def find_handle # Méthode qui va chercher les handles

      array_handle = []
	  @names.map do |townhall_name, townhall_array|
	  	townhall_array.map do |key, value|
		 	@twitter = @client.user_search(key)
   		 	if @twitter
      			if twitter_user = @twitter.first
      				p twitter_user[:screen_name]
       				array_handle << twitter_user[:screen_name]
      			end
			end

	   	end
	  end
      return array_handle
	end

	def follow(array) # Méthode qui follow directement sur les handles concernés

		array.each do |handle|
			@client.follow(handle)
		end
	end

	def perform # Mise en relation des méthodes follow et find_handle
		follow(find_handle)
	end
end
