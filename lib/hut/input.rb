module Hut
  class Input

    def initialize(window)
      @window = window
      listen
    end

    def listen
      @input = Thread.new do
        @window.new_message gets
      end
    end
  end
end
