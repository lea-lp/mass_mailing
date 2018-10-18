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
require 'app/townhalls_add_to_db'





# hash = TownhallScrapper.new.perform_all

manager_db = AddToDb.new

townhalls = manager_db.read("db/townhall_scrapper.JSON")

handles = TownhallsFollower.new(townhalls).find_handle

manager_db.write_handles("db/townhall_scrapper.JSON", "db/townhall_handles.JSON", handles)




=begin
spreadsheet = DumpSpreadsheet.new
spreadsheet.send_to_drive(townhalls)
=end


#townhall_spreadsheet
#TownhallsMailer.new.perform(townhalls)
