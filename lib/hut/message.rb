module Hut
  class Message

    def initialize(hut, tinder_msg)
      @config = hut.config
      @msg = tinder_msg
    end

    def formatted_for_print
      "#{username}: #{body}"
    end

    def username
      @msg.user.name
    end

    def body
      @msg.body
    end
  end
end
