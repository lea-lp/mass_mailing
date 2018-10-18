require 'bundler'
Bundler.require

require 'nokogiri'
require 'open-uri'
require 'json'

$:.unshift File.expand_path("./../lib", __FILE__)


require 'app/townhall_scrapper'
require 'app/townhall_spreadsheet'
require 'app/townhalls_mailer'
require 'app/townhalls_follower'


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

=begin
spreadsheet = DumpSpreadsheet.new
spreadsheet.send_to_drive(townhalls)
=end

#townhalls_follower
#handles = TownhallsFollower.new(townhalls).find_handle
#p handles



#townhall_spreadsheet
#TownhallsMailer.new.perform(townhalls)
