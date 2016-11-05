require 'yelp'
require 'dotenv'
Dotenv.load

client = Yelp::Client.new({ consumer_key: ENV['YOUR_CONSUMER_KEY'],
                            consumer_secret: ENV['YOUR_CONSUMER_SECRET'],
                            token: ENV['YOUR_TOKEN'],
                            token_secret: ENV['YOUR_TOKEN_SECRET']
                          })

nonprofit_params = { category_filter: 'nonprofit',
           limit: 1
         }
response = client.search('San Francisco', nonprofit_params)

response.businesses.each do |organization|
  Charity.create!(name: organization.name,
                  lat: organization.location.coordinate.latitude,
                  lng: organization.location.coordinate.longitude,
                  address: organization.location.display_address,
                  phone: organization.display_phone,
                  url: organization.url)
                  # description: "A place to give back!")
end
