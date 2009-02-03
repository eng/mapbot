require 'rubygems'
gem 'twitter', '0.4.1'
gem 'sequel', '2.10.0'

require 'twitter'
require 'sequel'

DB = Sequel.sqlite('/Users/eng/code/mapbot/db/mapbot.sqlite3')
@twitter = Twitter::Base.new('mapbot', 'lem0n!ce')