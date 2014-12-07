require 'twitter'

module TwitterRouter
  class Engine

    attr_reader :config

    def initialize(config)
      @config = config
      @rest_client = ::Twitter::REST::Client.new do |client_config|
        client_config.consumer_key        = config.api_key
        client_config.consumer_secret     = config.api_secret
        client_config.access_token        = config.access_token
        client_config.access_token_secret = config.access_token_secret
      end
    end

    def followme(username)
      puts username
      @rest_client.follow(username)
      @rest_client.create_direct_message(username, "I just followed you")
    end

  end
end
