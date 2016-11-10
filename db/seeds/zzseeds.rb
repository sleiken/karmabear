require 'faker'

a = {name: "Project Homeless Connect",
     lat: 37.775632,
     lng: -122.419881,
     address: ["25 Van Ness Ave", "Ste 340", "San Francisco, CA 94102"],
     description: "Project Homeless Connect excels in connecting the most vulnerable San Franciscans to vital resources throughout the city. At our one-stop shop events and in our office every day, we link participants to difficult-to-obtain services including medical, dental and vision care, and employment assistance.",
     phone: "(415) 503-2123",
     url: "projecthomelessconnect.org",
     image_url: "http://media.al.com/wire/photo/project-homeless-connect-logojpg-ff7f05bc0c84ca31.jpg"
   }

Charity.create(a)

a1 = {name: "The Sanctuary",
     lat: 37.776282,
     lng: -122.411178,
     address: ["201 8th St", "", "San Francisco, CA 94103"],
     description: "The Sanctuary, formerly The Episcopal Sanctuary, provides emergency shelter to homeless adults who register through the City of San Francisco. The Sanctuary is a 24-hour facility and provides two meals a day to shelter residents.",
     phone: "(415) 487-3300",
     url: "http://ecs-sf.org/programs/sanctuary.html",
     image_url: "http://www.thecross-photo.com/images/The-Episcopal-Sanctuary.jpg"
   }

Charity.create(a1)

# Info for Glide:
c1 = Charity.find_by(name: "Glide")

Manager.create!(first_name: "Laurie",
                email: "manager@.com",
                last_name: "MacKenzie",
                username: "LMacKenzie",
                password: "123456",
                charity_id: c1.id
               )
manager = Manager.find_by(first_name: "Laurie")

c1.update_attributes(manager_id: manager.id)


Need.create!(name: "Heavy Blankets",
             description: "Many low-income people don't have enough money to buy warm blankets -- especially the homeless, who often suffer from the cold during the winter months.",
             quantity_needed: 45,
             status: 1,
             charity_id: c1.id)

Need.create!(name: "Toys",
             description: "We accept new, unwrapped toys, for the annual Toy Giveaway during and up to the holiday months. Please avoid toy guns and war toys and when purchasing dolls, please remember diversity.",
             quantity_needed: 100,
             status: 1,
             charity_id: c1.id)

Need.create!(name: "Tooth Brush-Tooth Paste-Dental Floss",
             description: "Love you to put these kits together and donate them",
             quantity_needed: 100,
             status: 1,
             charity_id: c1.id)

Need.create!(name: "Board Games",
             description: "Homeless children in shelters often have few personal possessions, including toys and board games. Please bring board games so the children have something to play with while they're staying in the shelter!",
             quantity_needed: 25,
             status: 1,
             charity_id: c1.id)

Need.create!(name: "Canned Meats",
             description: "Meat items act as the foundation to many meals, and constitute an important source of protein which gives us energy for everyday tasks. Canned items like tuna and chicken make for easy donations and add variety to the dinner table.",
             quantity_needed: 50,
             status: 1,
             charity_id: c1.id)

Need.create!(name: "Peanut Butter",
             description: "Jarred nut butters also make a reliable source of protein, and you can donate them with little fuss. Children particularly enjoy items like peanut butter which make it a good choice for families.",
             quantity_needed: 25,
             status: 1,
             charity_id: c1.id)

Need.create!(name: "Instant Oatmeal",
             description: "Breakfast constitutes a key meal for the day, so providing cereal options like instant oatmeal makes a reliable donation. Choose a multi-flavor pack to provide recipients with options and consider low-sugar varieties as well.",
             quantity_needed: 50,
             status: 1,
             charity_id: c1.id)

Need.create!(name: "Thick Socks(wool)",
             description: "Many low-income people don't have enough money to buy warm socks -- especially the homeless, who often suffer from the cold during the winter months.",
             quantity_needed: 100,
             status: 1,
             charity_id: c1.id)

Event.create!(name: "Holiday Toy Drive",
              start: "2016-10-01 04:10:12",
              end: "2016-12-24 06:10:12",
              description: "We accept new, unwrapped toys, for the annual Toy Giveaway during and up to the holiday months. Please avoid toy guns and war toys and when purchasing dolls, please remember diversity.",
              givers_needed: 10,
              charity_id: c1.id)

Event.create!(name: "Halloween Candy Drive",
              start: "2016-11-01 12:00:00",
              end: "2016-12-01 12:00:00",
              description: "Got leftover candy lying around? Donate it to Glide! We use it to make candy packs that we hand out on the streets to our clients, homeless youth and young adults in San Francisco.",
              givers_needed: 10,
              charity_id: c1.id)

Event.create!(name: "Nightly Meal Service",
              start: "2016-01-01 00:00:00",
              end: "20016-12-31 12:00:00",
              description: "Serving a meal in the Daily Free Meals Program is a transformative experience. This program requires 85 volunteers each day to fill prep and dinner shifts, 364 days a year. With your help we can serve up to 2,400 meals per day to our community.",
              givers_needed: 200,
              charity_id: c1.id)

Event.create!(name: "Weekly tutoring",
              start: "2016-01-01 00:00:00",
              end: "20016-12-31 12:00:00",
              description: "A tutor can make all the difference. Just having adult attention can spur children to do their best. It takes nothing more than a little time. Weekly tutoring volunteers are needed every Tuesday, Wednesday, and Thursday!",
              givers_needed: 35,
              charity_id: c1.id)


Event.create!(name: "Trip to the Museum!",
              start: "2016-12-01 10:00:00",
              end: "20016-12-01 09:00:00",
              description: "Frequently, the only environment a homeless child knows is that of the street, shelters, or other transitory housing. Outside of school -- if they attend -- these children have little exposure to many of the simple pleasures that most kids have. Volunteer take children to the Exploratorium on the weekend.",
              givers_needed: 5,
              charity_id: c1.id)


# Info for CounterPulse
c2 = Charity.find_by(name: "CounterPulse")

Need.create!(name: "Costumes",
             description: "CounterPulse is proud to present Performing Diaspora a multimedia dance theatre piece that reflects on personal experiences of first-generation Pilipina-American daughters. If you have costumes that may fit our performance, bring them by!",
             quantity_needed: 25,
             status: 1,
             charity_id: c2.id)

Need.create!(name: "Props",
             description:"CounterPulse is proud to present Performing Diaspora a multimedia dance theatre piece that reflects on personal experiences of first-generation Pilipina-American daughters. If you have props that may fit our performance, bring them by!",
             quantity_needed: 25,
             status: 1,
             charity_id: c2.id)

Need.create!(name: "Instruments",
             description: "CounterPulse is proud to present Performing Diaspora a multimedia dance theatre piece that reflects on personal experiences of first-generation Pilipina-American daughters. If you have instruments that may fit our performance, bring them by!",
             quantity_needed: 10,
             status: 1,
             charity_id: c2.id)

Need.create!(name: "Lighting Equipment",
             description: "CounterPulse is proud to present Performing Diaspora a multimedia dance theatre piece that reflects on personal experiences of first-generation Pilipina-American daughters. If you have ligting equipment that you would like to donate, bring them by!",
             quantity_needed: 5,
             status: 1,
             charity_id: c2.id)

Event.create!(name: "Production Ushers",
              start: "2016-12-04 00:00:00",
              end: "20016-12-04 12:00:00",
              description: "Gain experience supporting artist productions, meet folks in your creative community, and make a difference by giving back to a thriving and dynamic arts community. Join us and volunteer to be an Usher for an upcoming production!",
              givers_needed: 35,
              charity_id: c2.id)

Event.create!(name: "Production Box Office Staff",
              start: "2016-12-11 00:00:00",
              end: "20016-12-11 12:00:00",
              description: "Gain experience supporting artist productions, meet folks in your creative community, and make a difference by giving back to a thriving and dynamic arts community. Join us and volunteer to be Box Office staff for an upcoming production!",
              givers_needed: 35,
              charity_id: c2.id)

Event.create!(name: "Host an Improv Class!",
              start: "2016-01-01 00:00:00",
              end: "20016-12-31 12:00:00",
              description: "Gain experience supporting artist productions, meet folks in your creative community, and make a difference by giving back to a thriving and dynamic arts community. Join us and volunteer to host an improv night!",
              givers_needed: 35,
              charity_id: c2.id)

# ************************************************************

Giver.create!(first_name: "Sarah",
              last_name: "Lee",
              username: "Slee43",
              email: "SLee@123.com",
              password: "password",
              points: 35)

Giver.create!(first_name: "Jacob",
              last_name: "Ramos",
              username: "JR2525",
              email: "Jacob@123.com",
              password: "password",
              points: 72)

Giver.create!(first_name: "Cassie",
              last_name: "Strong",
              username: "StrongCass21",
              email: "Strong@123.com",
              password: "password",
              points: 20)

Giver.create!(first_name: "Christopher",
              last_name: "Branch",
              username: "ChrisBranch15",
              email: "Branch@123.com",
              password: "password",
              points: 12)

Giver.create!(first_name: "Sarah",
              last_name: "Birch",
              username: "SBirch43",
              email: "SBirch@123.com",
              password: "password",
              points: 15)

Giver.create!(first_name: "Maxwell",
              last_name: "Mathis",
              username: "MaxMathis42",
              email: "Mathis@123.com",
              password: "password",
              points: 16)

Giver.create!(first_name: "Jessica",
              last_name: "Montez",
              username: "Jessie65",
              email: "Montez@123.com",
              password: "password",
              points: 21)

Giver.create!(first_name: "Ben",
              last_name: "Fisher",
              username: "FisherRails2323",
              email: "Fisher@123.com",
              password: "password",
              points: 5)

Giver.create!(first_name: "Chloe",
              last_name: "Fitz",
              username: "FitzyLoe22",
              email: "Fitz@124.com",
              password: "password",
              points: 18)

Giver.create!(first_name: "Philp",
              last_name: "Smith",
              username: "Phil_22",
              email: "Smith@123.com",
              password: "password",
              points: 18)

Giver.create!(first_name: "Angelica",
              last_name: "Castro",
              username: "AngieCastro_45",
              email: "Castro@123.com",
              password: "password",
              points: 18)

Giver.create!(first_name: "Melanie",
              last_name: "Stoval",
              username: "Melanie_rose13",
              email: "Stovall@123.com",
              password: "password",
              points: 18)

Giver.create!(first_name: "John",
              last_name: "Fitz",
              username: "FitzyLoe21",
              email: "JFitz@123.com",
              password: "password",
              points: 18)

Giver.create!(first_name: "Peter",
              last_name: "Lopez",
              username: "PeterLo12",
              email: "Lopez2@123.com",
              password: "password",
              points: 18)

Giver.create!(first_name: "Nick",
              last_name: "Roberts",
              username: "Roberts2134",
              email: "Roberts@123.com",
              password: "password",
              points: 18)

def unique_uname
  name = Faker::Internet.user_name
  if Giver.find_by(username: name)
    name = name + 's'
  end
  name
end

300.times do
  Giver.create!(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                username: unique_uname,
                email: Faker::Internet.email,
                password: "password",
                points: rand(1..100))
end

num = 2
276.times do
  Subscription.create!(charity_id: c1.id,
                       giver_id: num,
                       created_at: DateTime.now - (rand * 320))
  num +=1
end

m1 = Event.find_by(name: "Nightly Meal Service")
m2 = Event.find_by(name: "Trip to the Museum!")


n = 5
40.times do
  Registration.create!(event_id: m1.id,
                     giver_id: n,
                     pending_hours: rand(1..4),
                     approved_hours: 0)
  n+=1
end


n1 = 45
3.times do
  Registration.create!(event_id: m2.id,
                     giver_id: n1,
                     pending_hours: rand(1..6),
                     approved_hours: 0)
  n1+=1
end


b = Need.find_by(name: "Board Games")

d = 34
5.times do
  Donation.create!(need_id: b.id,
                   giver_id: d,
                   quantity_pending: rand(1..4))
  d += 1
end

b1 = Need.find_by(name: "Peanut Butter")
d1 = 50
5.times do
  Donation.create!(need_id: b1.id,
                   giver_id: d1,
                   quantity_pending: rand(1..6))
  d += 1
end
