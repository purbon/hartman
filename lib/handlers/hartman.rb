require 'urban/dictionary'

module Lita
  module Handlers
    class Hartman < Handler

      route(/^urbandict\s+(.+)/, :define, :help => { "Hartman: urbandict WORD" => "list of definitions found within the Urban Dictionary" })

      def define(response)
        entries = ::Urban::Dictionary.new.lookup(response.args)
        response.reply "Matches: " if entries
        count = 0
        entries.each do |entry|
          response.reply "ID: #{count} #{entry[:def]}"
          response.reply "Example: "
          response.reply entry[:example]
          response.reply "----"
          count+=1
        end
      end
    end
    Lita.register_handler(Hartman)
  end
end
