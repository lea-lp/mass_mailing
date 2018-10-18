require 'bundler'
Bundler.require

require 'nokogiri'
require 'open-uri'
require 'json'

$:.unshift File.expand_path("./../lib", __FILE__)


require 'app/townhall_scrapper'
require 'app/townhall_spreadsheet'
require 'app/townhalls_mailer'


#You're using bundler for your gem dependecies and you're doing it right
#but OpenUri is part of the Ruby standard library.
#That's why you only need to require it if you want to use it in your code.

# myObj = Emails.new.perform;
# myJSON = JSON.stringify(myObj);
# localStorage.setItem("/db/emails.JSON", myJSON);


=begin
#townhall_scrapper
File.open("db/townhall_scrapper.JSON","w") do |f|
  f.write((TownhallScrapper.new.perform_all).to_json)
end
=end

#townhall_spreadsheet
townhall_scrapper_json = File.read("db/townhall_scrapper.JSON")
townhalls = JSON.parse(townhall_scrapper_json)

spreadsheet = DumpSpreadsheet.new
spreadsheet.send_to_drive(townhalls)


=begin
#townhall_spreadsheet
hash_townhalls_example = Hash.new

hash_townhalls_lot = Hash.new
hash_townhalls_ardeche = Hash.new


hash_townhalls_lot["Paris"] = ["75","david.gerard.42@gmail.com"] 
hash_townhalls_ardeche["Montpellier"] = ["34","david.gerard.42@gmail.com"]

hash_townhalls_example["lot"] = hash_townhalls_lot
hash_townhalls_example["ardeche"] = hash_townhalls_ardeche

TownhallsMailer.new.perform(hash_townhalls_example)
=end