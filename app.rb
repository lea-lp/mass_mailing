
require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/townhall_scrapper'
require 'nokogiri'
require 'open-uri'
require 'json'

#You're using bundler for your gem dependecies and you're doing it right
#but OpenUri is part of the Ruby standard library.
#That's why you only need to require it if you want to use it in your code.

# myObj = Emails.new.perform;
# myJSON = JSON.stringify(myObj);
# localStorage.setItem("/db/emails.JSON", myJSON);

File.open("db/townhall_scrapper.JSON","w") do |f|
  f.write((TownhallScrapper.new.perform_all).to_json)
end
