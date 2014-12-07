require 'hartman/weather/engine'

module WeatherRouter

  def weatherin(response)
    data = Engine.new.check(response.matches)
    msg  = "at #{data['date']} is #{data['text']}, with #{((data['temp'].to_i-30)/2)}°C"
    response.reply "Dear #{response.message.source.user.name}, weather #{msg}"
  rescue
    puts "error retrieving data from yahoo weather"
  end

end
