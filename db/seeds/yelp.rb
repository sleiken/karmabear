require 'yelp'
require 'dotenv'
Dotenv.load

client = Yelp::Client.new({ consumer_key: ENV['YOUR_CONSUMER_KEY'],
                            consumer_secret: ENV['YOUR_CONSUMER_SECRET'],
                            token: ENV['YOUR_TOKEN'],
                            token_secret: ENV['YOUR_TOKEN_SECRET']
                          })

response = client.search('San Francisco')
# p response
p "ASDFASDFASDF"
