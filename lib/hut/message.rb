module Hut
  class Message

    def initialize(hut, room, tinder_msg)
      @me = hut.me
      @room = room
      @msg = tinder_msg
    end

    def formatted_for_print
      "#{'* ' if by_me?}#{username}: #{body}"
    end

    def by_me?
      @me.id == @msg.user.id
    end

    def username
      @msg.user.name
    end

    def body
      @msg.body
    end
  end
end
