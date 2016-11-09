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

Manager.create!(first_name: "Laurie",
                email: "manager@.com",
                last_name: "MacKenzie",
                username: "LMacKenzie",
                password: "123456",
                charity_id: 13)

Need.create!(name: "Heavy Blankets",
             description: "Many low-income people don't have enough money to buy warm blankets -- especially the homeless, who often suffer from the cold during the winter months.",
             quantity_needed: 45,
             status: 1,
             charity_id: 13)

Need.create!(name: "Toys",
             description: "We accept new, unwrapped toys, for the annual Toy Giveaway during and up to the holiday months. Please avoid toy guns and war toys and when purchasing dolls, please remember diversity.",
             quantity_needed: 100,
             status: 1,
             charity_id: 13)

Need.create!(name: "Tooth Brush-Tooth Paste-Dental Floss",
             description: "Love you to put these kits together and donate them",
             quantity_needed: 100,
             status: 1,
             charity_id: 13)

Need.create!(name: "Board Games",
             description: "Homeless children in shelters often have few personal possessions, including toys and board games. Please bring board games so the children have something to play with while they're staying in the shelter!",
             quantity_needed: 100,
             status: 1,
             charity_id: 13)

Need.create!(name: "Canned Meats",
             description: "Meat items act as the foundation to many meals, and constitute an important source of protein which gives us energy for everyday tasks. Canned items like tuna and chicken make for easy donations and add variety to the dinner table.",
             quantity_needed: 50,
             status: 1,
             charity_id: 13)

Need.create!(name: "Peanut Butter",
             description: "Jarred nut butters also make a reliable source of protein, and you can donate them with little fuss. Children particularly enjoy items like peanut butter which make it a good choice for families.",
             quantity_needed: 25,
             status: 1,
             charity_id: 13)

Need.create!(name: "Instant Oatmeal",
             description: "Breakfast constitutes a key meal for the day, so providing cereal options like instant oatmeal makes a reliable donation. Choose a multi-flavor pack to provide recipients with options and consider low-sugar varieties as well."
             status: 1,
             charity_id: 45)

Need.create!(name: "Thick Socks(wool)",
             description: "Many low-income people don't have enough money to buy warm socks -- especially the homeless, who often suffer from the cold during the winter months."
             status: 1,
             charity_id: 45)

Event.create!(name: "Holiday Toy Drive",
              start: "2016-10-01 04:10:12",
              end: "2016-12-24 06:10:12",
              description: "We accept new, unwrapped toys, for the annual Toy Giveaway during and up to the holiday months. Please avoid toy guns and war toys and when purchasing dolls, please remember diversity.",
              givers_needed: 10,
              charity_id: 13)


Event.create!(name: "Halloween Candy Drive",
              start: "2016-11-01 12:00:00",
              end: "2016-12-01 12:00:00"
              description: "Got leftover candy lying around? Donate it to Glide! We use it to make candy packs that we hand out on the streets to our clients, homeless youth and young adults in San Francisco.",
              givers_needed: 10,
              charity_id: 13)

Event.create!(name: "Nightly Meal Service"
              start: "2016-01-01 00:00:00",
              end: "20016-12-31 12:00:00",
              description: "Serving a meal in the Daily Free Meals Program is a transformative experience. This program requires 85 volunteers each day to fill prep and dinner shifts, 364 days a year. With your help we can serve up to 2,400 meals per day to our community.",
              givers_needed: 200,
              charity_id: 13)

Event.create!(name: "Weekly tutoring",
              start: "2016-01-01 00:00:00",
              end: "20016-12-31 12:00:00",
              description: "A tutor can make all the difference. Just having adult attention can spur children to do their best. It takes nothing more than a little time. Weekly tutoring volunteers are needed every Tuesday, Wednesday, and Thursday!,"
              givers_needed: 35,
              charity_id: 13)


Event.create!(name: "Trip to the Museum!",
              start: "2016-12-01 10:00:00",
              end: "20016-12-01 09:00:00",
              description: "Frequently, the only environment a homeless child knows is that of the street, shelters, or other transitory housing. Outside of school -- if they attend -- these children have little exposure to many of the simple pleasures that most kids have. Volunteer take children to the Exploratorium on the weekend.",
              givers_needed: 5,
              charity_id: 13)


Need.create!(name: "Instant Oatmeal",
             description: "Breakfast constitutes a key meal for the day, so providing cereal options like instant oatmeal makes a reliable donation. Choose a multi-flavor pack to provide recipients with options and consider low-sugar varieties as well."
             status: 1,
             charity_id: 45)



Giver.create!(first_name: "Sarah",
              last_name: "Lee",
              username: "Slee43",
              email: "SLee@123.com",
              password: "password",
              points: 0)

Giver.create!(first_name: "Jacob",
              last_name: "Ramos",
              username: "JR2525",
              email: "Jacob@123.com",
              password: "password",
              points: 0)

Giver.create!(first_name: "Cassie",
              last_name: "Strong",
              username: "StrongCass21",
              email: "Strong@123.com",
              password: "password",
              points: 0)

Giver.create!(first_name: "Christopher",
              last_name: "Branch",
              username: "ChrisBranch15",
              email: "Branch@123.com",
              password: "password",
              points: 0)

Giver.create!(first_name: "Sarah",
              last_name: "Lee",
              username: "Slee43",
              email: "SLee@123.com",
              password: "password",
              points: 0)












