module Hut
  class Window
    require 'highline'

    def initialize(hut)
      @out = $stdout
      @columns, @lines = HighLine::SystemExtensions.terminal_size
      @room = nil
      @input = Input.new self
    end

    def room=(room)
      @room = room
      update
    end

    def update
      clear
      print_header
      @room.last_messages(@lines - 4).each do |msg|
        @out.print "#{msg.formatted_for_print}\n"
      end
      @out.flush
      print_footer
    end

    def room_was_updated(room)
      if room == @room
        update
      end
    end

    def new_message(body)
      @room.new_message body
    end

    private

      def clear
        @out.print "\e[2J\e[f"
      end

      def print_header
        @out.print "#{@room.name}\n"
        @out.print "#{'-' * @columns}\n"
        @out.flush
      end

      def print_footer
        @out.print "#{'-' * @columns}\n"
        @out.print ">"
      end
  end
end
