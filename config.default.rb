Mapbot.init do
  Mapbot.db_path = 'db/mapbot.sqlite3'
  Mapbot.twitter_username = 'PUT YOURS HERE'
  Mapbot.twitter_password = 'PUT YOURS HERE'
  Mapbot.yelp_api_key = 'PUT YOURS HERE'
end

include Geokit::Geocoders
Geokit::Geocoders::timeout = 3
Geokit::Geocoders::yahoo = 'PUT YOURS HERE'
Geokit::Geocoders::google = 'PUT YOURS HERE'
Geokit::Geocoders::geocoder_us = false 
Geokit::Geocoders::provider_order = [:google, :yahoo, :us]