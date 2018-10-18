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


# SCRAPPER
# Ne pas lancer, c'est très long...!
# hash = TownhallScrapper.new.perform_all

# GESTION DE DONNÉES JSON
manager_db = AddToDb.new
townhalls = manager_db.read("db/townhall_scrapper.JSON")

# CRÉATION SPREADSHEET GOOGLE
spreadsheet = DumpSpreadsheet.new
townhall_handles = manager_db.read("db/townhall_handles.JSON")
spreadsheet.send_to_drive(townhalls)

# TWITTER
manager_twitter = TownhallsFollower.new(townhalls)
manager_twitter.follow
handles = manager_twitter.find_handle

# MAJ SPREADSHEET AVEC HANDLES
manager_db.write_handles("db/townhall_scrapper.JSON", "db/townhall_handles.JSON", handles)

# MAILER
# Ne pas lancer, risque d'envoi de mails trop important
#TownhallsMailer.new.perform(townhalls)
