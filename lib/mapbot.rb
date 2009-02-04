require 'rubygems'
require 'twitter'
require 'geokit'
require 'sequel'
require 'cgi'
require 'open-uri'

module Mapbot
  class << self
    attr_accessor :db_path, :twitter_username, :twitter_password
    
    def init
      yield if block_given?
      @db ||= Sequel.sqlite(@db_path)
      @twitter ||= Twitter::Base.new(@twitter_username, @twitter_password)
    end
    
    def post_new_tweets
      @twitter.replies.each { |tweet| post_new_tweet(tweet) }
    end
  
    def post_new_tweet(tweet)
      return unless new_tweet?(tweet)
      tweet.text.gsub! /\@mapbot /, ''
      geocoded_address = MultiGeocoder.geocode(tweet.text).full_address
      google_maps_url = "http://maps.google.com/maps?q=#{CGI.escape(geocoded_address)}"
      tiny_url = open("http://tinyurl.com/api-create.php?url=#{google_maps_url}").read
      text = "@#{tweet.user.screen_name} #{tiny_url}"
      @db[:tweets].insert(:id => tweet.id)
      @twitter.post(text)
    end
  
    def new_tweet?(tweet)
      @db[:tweets].where(:id => tweet.id).empty?
    end
  end
end