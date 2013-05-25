module Hut
  class Room

    attr_reader :name

    def initialize(campfire, room_name)
      @name = room_name
      @room = campfire.rooms.select do |room|
        room.name.downcase == room_name
      end.first
      @messages = []
      get_recent_messages
    end

    def window=(window)
      @window = window
    end

    def listen
      @room.listen do |msg|
        add_message msg.body
      end
    end

    def add_message(text)
      if text
        @messages << text
        @window.room_was_updated(self) if @window
      end
    end

    def last_messages(num)
      @messages.last(num)
    end

    def get_recent_messages
      # Room#recent calls Time.parse
      require 'time'
      @room.recent.each do |msg|
        add_message msg.body
      end
    end
  end
end
