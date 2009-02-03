#!/usr/bin/ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'mapbot'
include Geokit::Geocoders

@twitter.replies.each do |tweet|
  begin
    if DB[:tweets].where(:id => tweet.id).empty?
      tweet.text.gsub! /\@mapbot /, ''
      geocoded_address = MultiGeocoder.geocode(tweet.text).full_address
      google_maps_url = "http://maps.google.com/maps?q=#{CGI.escape(geocoded_address)}"
      tiny_url = open("http://tinyurl.com/api-create.php?url=#{google_maps_url}").read
      text = "@#{tweet.user.screen_name} #{tiny_url}"
      DB[:tweets].insert(:id => tweet.id)
      @twitter.post(text)
    end
  rescue
    nil
  end
end