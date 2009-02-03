$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'mapbot'

@twitter.replies.each do |tweet|
  if DB[:tweets].where(:id => tweet.id).empty?
    tweet.text.gsub! /\@mapbot /, ''
    text = "@#{tweet.user.screen_name} #{tweet.text} to you too"
    DB[:tweets].insert(:id => tweet.id)
    @twitter.post(text)
  end
end