GLIDE = Charity.find_by(name: "Glide")

10.times do |i|
  Event.create(name: "Event#{1}",
               description: Faker::Hipster.paragraph,
               start: Time.now,
               end: Time.now,
               givers_needed: "#{1 + 1}",
               charity: GLIDE
              )
end

10.times do |i|
  Need.create(name: "Need#{1}",
              description: Faker::Hipster.paragraph,
              quantity_needed: "#{1 + 1}",
              charity: GLIDE
             )
end
