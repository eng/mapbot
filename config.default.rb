Mapbot.init do
  Mapbot.db_path = 'db/mapbot.sqlite3'
  Mapbot.twitter_username = 'mapbot'
  Mapbot.twitter_password = 'lem0n!ce'
  Mapbot.yelp_api_key = 'DX0Kb0pB62uyQSuK74nFEA'
end

include Geokit::Geocoders
Geokit::Geocoders::timeout = 3
Geokit::Geocoders::yahoo = 't.5J7cPV34GSc36G4E977U17VGt21xQBYliOgQqBFCZUm0.b8CklRnFB58LVgL8o'
Geokit::Geocoders::google = 'ABQIAAAAt7tTULp7SNQT-qPTLSMtjRT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRm5nERXrpuW78knxyegyHlxQGnvw'
Geokit::Geocoders::geocoder_us = false 
Geokit::Geocoders::provider_order = [:google, :yahoo, :us]