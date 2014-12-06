require 'json'

module UrbanRouter
  class Engine

    def initialize
      @con = Faraday.new do |faraday|
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def lookup(word)
      query(word.join.strip) do |body|
        body["list"].map do |entry|
          {:def => entry['definition'], :example => entry['example']}
        end
      end
    end

    private

    def query(word)
      response = @con.get "http://api.urbandictionary.com/v0/define?term=#{word}"
      return [] unless (response.status == 200)
      yield ::JSON.parse(response.body)
    end
  end
end
