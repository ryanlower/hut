require 'hut/config'
require 'hut/cli'
require "hut/message"
require "hut/room"
require "hut/window"
require "hut/version"

module Hut
  class Hut
    require 'tinder'

    attr_reader :config

    def initialize
      @config = Config.new
      @window = Window.new self
      @room = Room.new self, 'test'
    end

    def campfire
      @campfire ||= Tinder::Campfire.new @config.account, token: @config.token
    end

    def listen
      @window.room = @room
      @room.window = @window
      @room.listen
    end

    def new_message(msg)
      Message.new self, msg
    end
  end
end
