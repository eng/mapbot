require 'rubygems'

namespace :mapbot do
  task :init do
    require File.join(File.dirname(__FILE__), 'lib', 'schema.rb')
  end
  
  desc "Creates the DB, duh."
  task :create_db => :init do
    Mapbot.create_db
  end
end