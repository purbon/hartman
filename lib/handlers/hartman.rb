require 'hartman/urban/urban'

module Lita
  module Handlers
    class Hartman < Handler

      include UrbanRouter

      route(/^define\s+me\s+(.+)/, :defineme, :help => { "Hartman: urbandict WORD" => "list of definitions found within the Urban Dictionary" })

    end
    Lita.register_handler(Hartman)
  end
end
