require 'uri'

module WeatherRouter
  class Engine

    BASE_URL = "http://query.yahooapis.com/v1/public/yql".freeze

    #https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22dallas%2C%20tx%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys
    def initialize
      @con = Faraday.new do |faraday|
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

    end

    #{"query"=>{"count"=>1, "created"=>"2014-12-07T00:48:32Z", "lang"=>"en-US",
    #           "results"=>{"channel"=>{"item"=>{
    #                       "condition"=>{"code"=>"20", "date"=>"Sun, 07 Dec 2014 1:19 am CET", "temp"=>"39", "text"=>"Fog"}}}}}}
    def check(place)
      query(place.join.strip) do |body|
        body['query']['results']['channel']['item']['condition']
      end
    end

    private

    def query(place)
      yql  = "select item.condition.text, item.condition  from weather.forecast where woeid in (select woeid from geo.places(1) where text='#{place}')";
      response = @con.get "#{BASE_URL}?q=#{URI::escape(yql)}&format=json"
      return [] unless (response.status == 200)
      yield ::JSON.parse(response.body)
    end

  end
end
