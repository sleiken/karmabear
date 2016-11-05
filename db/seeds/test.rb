Tag.find_or_create_by(name: "Food Bank")

Charity.find_or_create_by(name: "SF Marin Food Bank",
               lat:  "37.7983818054199",
               lng:  "-122.407821655273",
               address: ["900 Pennsylvania Ave", "", "San Francisco, CA",  "94107"],
               phone: "+14154212337",
               url: "https://www.sfmfoodbank.org",
               description: "A place to give back!",
               manager_id: 1)

CharityTag.find_or_create_by(tag_id: 1, charity_id: 1)

Manager.find_or_create_by(first_name: "Billy",
               email: "manager@charity.com",
               last_name: "Bob",
               username: "BillyBob",
               password: "123456",
               charity_id: 1)

Giver.find_or_create_by(first_name: "James",
             last_name: "Dean",
             username: "JDean",
             email: "JDean@123.com",
             password: "password",
             points: 0)

Need.find_or_create_by(name: "Blankets",
            description: "Heavy blankets for the fall season!",
            quantity_needed: 10,
            status: "Active",
            charity_id: 1)


Event.find_or_create_by(name: "Can Food Drive",
             start: "2016-12-25 04:10:12",
             end: "2016-12-25 06:10:12",
             description: "Come in and bring your cans!",
             givers_needed: 10,
             charity_id: 1)

Registration.find_or_create_by(event_id: 1,
                    giver_id: 1,
                    hours: 2)

Subscription.find_or_create_by(charity_id: 1,
                    giver_id: 1)

Donation.find_or_create_by(need_id: 1,
                giver_id: 1,
                quantity_given: 5)

Location.find_or_create_by(name: "Work",
                lat: "37.7983818054199",
                lng: "-122.407821655273",
                giver_id: 1)
