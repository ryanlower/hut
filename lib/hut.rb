require 'hut/config'
require 'hut/cli'
require "hut/room"
require "hut/window"
require "hut/version"

module Hut
  class Hut
    require 'tinder'

    def initialize
      @config = Config.new
      @window = Window.new
      @room = Room.new campfire, 'test'
    end

    def campfire
      @campfire ||= Tinder::Campfire.new @config.account, token: @config.token
    end

    def listen
      @window.room = @room
      @room.window = @window
      @room.listen
    end
  end
end
