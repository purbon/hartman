require "hartman/twitter/engine"

module TwitterRouter

  def followme(response)
    Engine.new(Lita.config.adapter).followme(response.message.source.user.name)
  rescue Exception => e
    puts e
    puts "There where problems while talking to twitter"
  end

end
