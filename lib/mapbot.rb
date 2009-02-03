require 'rubygems'
require 'twitter'
require 'geokit'
require 'sequel'
require 'cgi'
require 'open-uri'

Geokit::Geocoders::timeout = 3
Geokit::Geocoders::yahoo = 't.5J7cPV34GSc36G4E977U17VGt21xQBYliOgQqBFCZUm0.b8CklRnFB58LVgL8o'
Geokit::Geocoders::google = 'ABQIAAAAt7tTULp7SNQT-qPTLSMtjRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRm5nERXrpuW78knxyegyHlxQGnvw'
Geokit::Geocoders::geocoder_us = false 
Geokit::Geocoders::provider_order = [:google,:us,:yahoo]

DB = Sequel.sqlite('db/mapbot.sqlite3')
@twitter = Twitter::Base.new('mapbot', 'lem0n!ce')