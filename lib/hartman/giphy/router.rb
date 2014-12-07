require 'giphy'

Giphy::Configuration.configure do |config|
  config.version = "v1"
  config.api_key = "dc6zaTOxFJmzC"
end

module GiphyRouter

  def imageme(response)
    entries = Giphy.search(response.matches.join(' '), {limit: 10}).shuffle[0...1]
    entries.each do |entry|
      response.reply "@#{response.message.source.user.name} #{entry.embed_url}"
    end
  rescue Exception => e
    puts e
    puts "error retrieving data from Giphy"
  end
end
