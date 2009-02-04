#!/usr/bin/ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'mapbot'
require 'geokit'
require File.join(File.dirname(__FILE__), 'config.rb')

Mapbot.post_new_tweets rescue nil