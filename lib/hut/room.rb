module Hut
  class Room

    attr_reader :name

    def initialize(hut, room_name)
      @hut = hut
      @name = room_name
      @room = @hut.campfire.rooms.select do |room|
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
        add_message msg
      end
    end

    def new_message(body)
      @room.speak body
    end

    def add_message(msg)
      if msg.body
        @messages << @hut.new_message(self, msg)
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
        add_message msg
      end
    end
  end
end
