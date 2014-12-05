module Lita
  module Handlers
    class Hartman < Handler

      route(/^echo\s+(.+)/, :echo)

      def echo(response)
        response.reply "fuck you!"
      end
    end
    Lita.register_handler(Hartman)
  end
end
