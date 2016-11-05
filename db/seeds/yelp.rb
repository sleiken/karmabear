require 'yelp'
require 'dotenv'
Dotenv.load

client = Yelp::Client.new({ consumer_key: ENV['YOUR_CONSUMER_KEY'],
                            consumer_secret: ENV['YOUR_CONSUMER_SECRET'],
                            token: ENV['YOUR_TOKEN'],
                            token_secret: ENV['YOUR_TOKEN_SECRET']
                          })

nonprofit_params = { category_filter: 'nonprofit',
                     limit: 2
                   }
foodbank_params = { category_filter: 'foodbanks',
                    limit: 2
                  }
animalshelters_params = { category_filter: 'animalshelters',
                          limit: 2
                        }
culturalcenter_params = { category_filter: 'culturalcenter',
                          limit: 2
                        }
params = [nonprofit_params, foodbank_params, animalshelters_params, culturalcenter_params]

params.each do |param|
  response = client.search('San Francisco', param)

  response.businesses.each do |organization|
    Charity.create!(name: organization.name,
                    lat: organization.location.coordinate.latitude,
                    lng: organization.location.coordinate.longitude,
                    address: organization.location.display_address,
                    phone: organization.display_phone,
                    url: organization.url)
  end
end
