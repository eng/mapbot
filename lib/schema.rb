$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'mapbot'

module Mapbot
  def self.create_db
    @db.create_table :tweets do
      primary_key :id
    end
  end
end