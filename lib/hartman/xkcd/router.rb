require 'xkcd'

module XkcdRouter

  def xkcdme(response)
    response.reply "@#{response.message.source.user.name} #{XKCD.comic}"
  rescue Exception => e
    puts e
    puts "error retrieving data from Xkcd"
  end
end
