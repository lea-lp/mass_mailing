require 'nokogiri'
require 'open-uri'
require 'dotenv'
require 'twitter'


Dotenv.load


class TownhallsFollower
	attr_accessor :client, :names

	TESTING = ["@o0SamArts0o"]

	# Définition de la méthode set_keys, pour la synchronisation avec l'API

	def initialize # Initialisation du serveur

		@client = Twitter::REST::Client.new do |config|
  			config.consumer_key        = ENV["client_api_key"]
  			config.consumer_secret     = ENV["client_api_secret"]
  			config.access_token        = ENV["acces_token"]
  			config.access_token_secret = ENV["access_token_secret"]
  		end
  		@names = {"@o0SamArts0o" => ['mail','handle']}
	end

	def find_handle # Méthode qui va chercher les handles
	  names = Hash.new
	  names = {"montpellier" => ['mail','handle']}
      array = []
	  names.each do |key, value|
		 @twitter = @client.user_search(key)
   		 if @twitter
      		if twitter_user = @twitter.first
       			 array << twitter_user[:screen_name]
       			 puts array.inspect
      		end
		end
	   end
	end

	def follow # Méthode qui follow directement sur les onglets concernés

		i = 0
		@names.each do |townhall_name, townhall_array|
			i += 1
			@client.update("#{townhall_name} THP est une bonne formation enrichissante !!")
			if i == 3
				break
			end
		end
	end

end

testing = TownhallsFollower.new
testing.follow