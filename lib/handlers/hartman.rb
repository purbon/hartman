require 'hartman/urban/router'
require 'hartman/weather/router'
require 'hartman/giphy/router'
require 'hartman/xkcd/router'
require 'hartman/twitter/router'

module Lita
  module Handlers

    class Help < Handler
      def help(response)
        TwitterRouter::Engine.new(Lita.config.adapter).followme(response.message.source.user.name)
        output = build_help(response)
        output = filter_help(output, response)
        response.reply_privately output
      end
    end

    class Hartman < Handler

      include UrbanRouter
      include WeatherRouter
      include GiphyRouter
      include XkcdRouter
      include TwitterRouter

      route(/^define\s+me\s+(.+)/, :defineme, :help => { "HartmanBot: define me {WORD}" => "check the Urban Dictionary" })
      route(/weather\s+in\s+(.+)\?$/, :weatherin, :help => { "HartmanBot: weather in {PLACE}?" => "check the weather in a given place" })
      route(/image\s+me\s+in\s+(.*)/, :imageme, :help => { "HartmanBot: image me {WORD}" => "search for funny images"})
      route(/image\s+me\s+(.*)/, :imageme)
      route(/image\s+me\s+with\s+a\s+(.*)/, :imageme)
      route(/follow\s+me/, :followme, :help => { "HartmanBot: follow me" => "Makes Hartman follow you"})
      route(/xkcd/, :xkcdme, :help => { "HartmanBot: xkcd" => "Finds a random XKCD commic"})
      route(/^ping/, :ping, :help => { "HartmanBot: ping" => "checking Hartman health" })

      def ping(response)
        response.reply "@#{response.message.source.user.name rescue 'Dear'}, what can I do for you?"
      end

    end
    Lita.register_handler(Hartman)
  end
end
