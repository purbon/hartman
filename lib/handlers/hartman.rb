require 'hartman/urban/router'
require 'hartman/weather/router'

module Lita
  module Handlers

    class Help < Handler
      def help(response)
        output = build_help(response)
        output = filter_help(output, response)
        response.reply_privately output
      end
    end

    class Hartman < Handler

      include UrbanRouter
      include WeatherRouter

      route(/^define\s+me\s+(.+)/, :defineme, :help => { "HartmanBot: define me {WORD}" => "check the Urban Dictionary" })
      route(/weather\s+in\s+(.+)\?$/, :weatherin, :help => { "HartmanBot: weather in {PLACE}?" => "check the weather in a given place" })
      route(/^ping/, :ping, :help => { "HartmanBot: ping" => "checking Hartman health" })

      def ping(response)
        response.reply "@#{response.message.source.user.name rescue 'Dear'}, what can I do for you?"
      end

    end
    Lita.register_handler(Hartman)
  end
end
