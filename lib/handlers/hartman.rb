require 'urban/dictionary'

module Lita
  module Handlers
    class Hartman < Handler

      route(/^define\s+me\s+(.+)/, :define, :help => { "Hartman: urbandict WORD" => "list of definitions found within the Urban Dictionary" })

      def define(response)
        entries = ::Urban::Dictionary.new.lookup(response.matches)
        response.reply_privately "Matches: " if entries
        count = 0
        entries.each do |entry|
          msg = "ID: #{count} #{entry[:def]}\nExample: #{entry[:example]}"
          response.reply_privately msg
          count+=1
        end
      end
    end
    Lita.register_handler(Hartman)
  end
end
