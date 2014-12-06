require 'hartman/urban/engine'

module UrbanRouter

  def defineme(response)
    entries = Engine.new.lookup(response.matches)
    response.reply_privately "Matches: " if entries
    count = 0
    entries.each do |entry|
      msg = "ID: #{count} #{entry[:def]}\nExample: #{entry[:example]}"
      response.reply_privately msg
      count+=1
    end
  end
end
