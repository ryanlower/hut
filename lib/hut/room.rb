module Hut
  class Room

    def initialize(campfire, room_name)
      @name = room_name
      @room = campfire.rooms.select do |room|
        room.name.downcase == room_name
      end.first
      @messages = []
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
      @messages << text
      @window.room_was_updated self
    end

    def last_messages(num)
      @messages.last(num)
    end
  end
end
