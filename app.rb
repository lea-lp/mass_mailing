require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)
$:.unshift File.expand_path("./../lib/views", __FILE__)

require "townhalls_mailer"



hash_townhalls_example = Hash.new

hash_townhalls_lot = Hash.new
hash_townhalls_ardeche = Hash.new


hash_townhalls_lot["Paris"] = ["75","david.gerard.42@gmail.com"] 
hash_townhalls_ardeche["Montpellier"] = ["34","david.gerard.42@gmail.com"]

hash_townhalls_example["lot"] = hash_townhalls_lot
hash_townhalls_example["ardeche"] = hash_townhalls_ardeche

TownhallsMailer.new.perform(hash_townhalls_example)

