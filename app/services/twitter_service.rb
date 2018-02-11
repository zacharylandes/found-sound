class TwitterService
  attr_reader :consumer_key,
              :consumer_secret,
              :access_token,
              :access_token_secret

  def initialize(store_token, store_secret)
    @consumer_key = ENV["TWITTER_CONSUMER_KEY"]
    @consumer_secret = ENV["TWITTER_CONSUMER_API_SECRET"]
    @access_token = store_token
    @access_token_secret = store_secret
  end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
  end

  def tweet(text)
    client.update(text)
  end
end
