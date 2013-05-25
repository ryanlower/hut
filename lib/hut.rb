require 'hut/cli'
require "hut/room"
require "hut/window"
require "hut/version"

module Hut
  require 'tinder'

  def self.campfire
    Tinder::Campfire.new ENV['HUBOT_CAMPFIRE_ACCOUNT'],
     token: ENV['HUBOT_CAMPFIRE_TOKEN']
  end

  def self.listen
    window = Window.new
    room = Room.new campfire, 'test'
    window.room = room
    room.window = window
    room.listen
  end
end
