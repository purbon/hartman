require 'hartman/urban/router'
require 'hartman/weather/router'

module Lita
  module Handlers
    class Hartman < Handler

      include UrbanRouter
      include WeatherRouter

      route(/^define\s+me\s+(.+)/, :defineme, :help => { "Hartman: define me {WORD}" => "list of definitions found within the Urban Dictionary" })
      route(/^weather\s+in\s+(.+)/, :weatherin, :help => { "Hartman: weather in {PLACE}" => "check the weather in a given place" })

    end
    Lita.register_handler(Hartman)
  end
end
