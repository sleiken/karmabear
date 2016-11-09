# attributes = {description: "", 
#               url: "", 
#               image_url: ""}
# obj = Charity.find_by_id()
# obj.update_attributes(attributes)

#1
attributes = {description: "Our mission is to end hunger in San Francisco and Marin. We envision a community where everyone is able to obtain enough nutritious food to support the health and well-being of themselves and their families.", 
              url: "https://www.sfmfoodbank.org/",
              image_url: "https://foodlocator.sfmfoodbank.org/images/logo-large.jpg"}
obj = Charity.find_by_id(1)
obj.update_attributes(attributes)

#2
attributes1 = {description: "HandsOn Bay Area creates awesome volunteer opportunities to connect cool companies and people like you to schools, parks and nonprofits that need your help.", 
              url: "https://www.handsonbayarea.org/", 
              image_url: "http://www.clearworks.net/wp-content/uploads/2015/08/hands-on-bay-area.jpg"}
obj1 = Charity.find_by_id(2)
obj1.update_attributes(attributes1)

#3
attributes2 = {description: "Our mission is to end hunger in San Francisco and Marin. We envision a community where everyone is able to obtain enough nutritious food to support the health and well-being of themselves and their families.", 
              url: "https://www.sfmfoodbank.org/", 
              image_url: "https://foodlocator.sfmfoodbank.org/images/logo-large.jpg"}
obj2 = Charity.find_by_id(3)
obj2.update_attributes(attributes2)

#4
attributes3 = {description: "One Brick provides support to local non-profit and community organizations by creating a unique, social and flexible volunteer environment for those interested in making a concrete difference in the community. We enable people to get involved, have an impact and have fun, without the requirements of individual long-term commitments.", 
              url: "http://www.onebrick.org/", 
              image_url: "https://s3-media2.fl.yelpcdn.com/bphoto/gA_Z6iEBU2wJKZFXS7QW1Q/o.jpg"}
obj3 = Charity.find_by(name: "One Brick")
obj3.update_attributes(attributes)

#5
attributes4 = {description: "Kiva is an international nonprofit, founded in 2005 and based in San Francisco, with a mission to connect people through lending to alleviate poverty. We celebrate and support people looking to create a better future for themselves, their families and their communities.", 
              url: "https://www.kiva.org/", 
              image_url: "https://www-kiva-org.global.ssl.fastly.net/cms/styles/fellows_blog_excerpt/s3/sites/default/files/kivablog/philippines_update_blog.jpg?itok=aNOGL0m5"}
obj4 = Charity.find_by(name: "Kiva")
obj4.update_attributes(attributes4)

#5
attributes5 = {description: "To empower generations of Chinese-American individuals and their families to fully participate in and contribute positively toward a healthy society. We put our Christian faith into action to help people learn, heal, and thrive.", 
              url: "https://cameronhouse.org/", 
              image_url: "https://cameronhouse.org/wp-content/uploads/2015/12/header-logo.png"}
obj5 = Charity.find_by_id(6)
obj5.update_attributes(attributes5)

#6
attributes6 = {description: "St. Anthony’s is an organization providing essential support to San Franciscans living in poverty. We believe that supporting people in need makes the city a better place to live. Every day, with dignity and respect, we offer thousands of the most vulnerable among us the basics we all need to feel human: a hot meal, fresh clothing, an opportunity to connect with the world around us.", 
              url: "https://www.stanthonysf.org/", 
              image_url: "https://www.stanthonysf.org/app/uploads/2015/09/STA_Horiz_RGB.png"}
obj6 = Charity.find_by_id(7)
obj6.update_attributes(attributes6)

#7
attributes7 = {description: "The Potrero Hill Neighborhood House, affectionately known as “the Nabe,” has enriched individuals and enhanced quality of life for generations of residents of the Hill and other San Francisco communities. This unshakable ground for stability is still needed to build and grow our community.", 
              url: "http://www.phnhsf.org/", 
              image_url: "http://www.phnhsf.org/wp-content/uploads/2014/02/cropped-Nabe-Angel-Dude1.jpg"}
obj7 = Charity.find_by_id(8)
obj7.update_attributes(attributes7)

#8
attributes8 = {description: "The mission of La Cocina is to cultivate low income food entrepreneurs as they formalize and grow their businesses by providing affordable commercial kitchen space, industry-specific technical assistance and access to market opportunities. We focus primarily on women from communities of color and immigrant communities.", 
              url: "http://www.lacocinasf.org/", 
              image_url: "http://www.lacocinasf.org/wp-content/uploads/2012/10/LaCocina_letterhead_gradient.jpg"}
obj8 = Charity.find_by_id(9)
obj8.update_attributes(attributes8)

#9
attributes9 = {description: "Namaste, originally from Sanskrit, loosely means to pay homage to the inner light in all living things.  This represents the purpose of Curry Without Worry: feeding hungry people; doing so in a dignified manner; and encouraging peaceful coexistence.", 
              url: "http://currywithoutworry.org/", 
              image_url: "http://ww2.kqed.org/bayareabites/wp-content/uploads/sites/24/2012/12/1_Curry-Without-Worry560.jpg"}
obj9 = Charity.find_by_id(10)
obj9.update_attributes(attributes9)

#10

attributes10 = {description: "We inspire girls to be joyful, healthy and confident using a fun, experience-based curriculum which creatively integrates running. We envision a world where every girl knows and activates her limitless potential and is free to boldly pursue her dreams.", 
                url: "http://www.gotrbayarea.org/", 
                image_url: "https://girlsontherunstlouis.org/sites/default/files/Logo_0.png"}
obj10 = Charity.find_by_id(11)
obj10.update_attributes(attributes10)

#11
attributes11 = {description: "CounterPulse is building a movement of risk-taking art that shatters assumptions and builds community. We provide space and resources for emerging artists and cultural innovators, serving as an incubator for the creation of socially relevant, community-based art and culture. CounterPulse acts as a catalyst for art and action; creating a forum for the open exchange of art and ideas, sparking transformation in our communities and our society.", 
                url: "http://www.counterpulse.org/", 
                image_url: "http://www.counterpulse.org/wp-content/uploads/2016/03/CP-Red.png"}
obj11 = Charity.find_by(name: "CounterPulse")
obj11.update_attributes(attributes11)

#12
attributes12 = {description: "GLIDE's mission is to create a radically inclusive, just and loving community mobilized to alleviate suffering and break the cycles of poverty and marginalization.", 
                url: "http://www.glide.org/", 
                image_url: "https://haasundergrad.files.wordpress.com/2013/11/locations_glide.jpg"}
obj12 = Charity.find_by(name: "Glide")
obj12.update_attributes(attributes12)


#14
attributes14 = {description: "UniversalGiving helps people give and volunteer with the top-performing projects all over the world.  All projects are vetted through UniversalGiving's trademarked, proprietary Quality Model. 100%\ of each donation goes directly to the cause.", 
                url: "http://www.universalgiving.org/", 
                image_url: "https://pbs.twimg.com/profile_images/635948942493007872/DyEKuO1t.jpg"}
obj14 = Charity.find_by(name: "UniversalGiving")
obj14.update_attributes(attributes14)

#15
attributes15 = {description: "Delancey Street is the country's leading residential self-help organization for former substance abusers, ex-convicts, homeless and others who have hit bottom.During their time at Delancey Street, residents receive a high school equivalency degree (GED) and are trained in 3 different marketable skills. Beyond academic and vocational training, residents learn important values, and the social and interpersonal skills that allow them to live successfully in the mainstream of society.", 
                url: "http://www.delanceystreetfoundation.org/", 
                image_url: "http://www.delanceystreetfoundation.org/images/logoleft.gif"}
obj15 = Charity.find_by(name: "Delancey Street Foundation")
obj15.update_attributes(attributes15)


#16
attributes16 = {description: "In partnership with our families, break the cycle of childhood poverty. By seizing the motivational opportunity created by pregnancy and parenthood, HPP joins with families to help them recognize their strengths and trust in their capacity to transform their lives.", 
              url: "http://www.homelessprenatal.org/", 
              image_url: "http://www.homelessprenatal.org/content/uploads/HPP3colorlogo3.png"}
obj16 = Charity.find_by_id(17)
obj16.update_attributes(attributes16)

#17
attributes17 = {description: "We focus on meeting the needs of a culturally, linguistically, and economically diverse community with services that promote stability for families, build skills and self-worth that allow toddlers, youth, and adults to reach for their dreams and succeed, and support seniors in remaining vital and independent.", 
              url: "http://www.telhi.org/", 
              image_url: "https://onepage.events.org/data/Telhi01/BG95212.png"}
obj17 = Charity.find_by_id(18)
obj17.update_attributes(attributes17)

#18
attributes18 = {description: "The mission of At The Crossroads is to reach out to homeless youth and young adults at their point of need, and work with them to build healthy and fulfilling lives. Our innovative model focuses on young people who do not access traditional services and are disconnected from any type of consistent support.", 
              url: "https://www.atthecrossroads.org/", 
              image_url: "http://www.ucarecdn.com/fbe6616e-86db-44d1-b117-a78e04e9b05c/-/preview/300x300/"}
obj18 = Charity.find_by_id(19)
obj18.update_attributes(attributes18)

#19
attributes19 = {description: "For over 45 years, the San Francisco Bicycle Coalition has been transforming San Francisco streets and neighborhoods into more livable and safe places by promoting the bicycle for everyday transportation. We are one of the largest and most effective bicycle advocacy groups in the country.", 
              url: "http://www.sfbike.org/", 
              image_url: "https://nationalbikechallenge.s3.amazonaws.com/lc_logos/1553/medium/SF_Bicycle_Coalition.png"}
obj19 = Charity.find_by(name: "At The Crossroads")
obj19.update_attributes(attributes19)

#20
attributes20 = {description: "The Mission Community Market (MCM) is the only Mission organization seeking to bring all the diverse people in our community together. Through healthy foods, local business and community events, we are turning public space into common ground.", 
              url: "http://missioncommunitymarket.org/", 
              image_url: "http://www.missionmission.org/wp-content/uploads/2013/11/Screen-shot-2013-11-19-at-1.54.06-PM.png"}
obj20 = Charity.find_by_id(21)
obj20.update_attributes(attributes20)

#21
attributes21 = {description: "Our mission is to end hunger in San Francisco and Marin. We envision a community where everyone is able to obtain enough nutritious food to support the health and well-being of themselves and their families.", 
              url: "https://www.sfmfoodbank.org/", 
              image_url: "https://foodlocator.sfmfoodbank.org/images/logo-large.jpg"}
obj21 = Charity.find_by_id(22)
obj21.update_attributes(attributes21)

#22
attributes22 = {description: "The Food Bank’s mission is to provide nutritious food to the low-income residents of the City of Alameda on a non-discriminating basis. The Alameda Food Bank is a private, non-affiliated, non-profit, tax-exempt agency. The Food Bank is overseen by a board of directors composed of community volunteers. Its day to day operation is run by two paid staff members and over 150 volunteers.", 
              url: "http://www.alamedafoodbank.org/", 
              image_url: "https://static1.squarespace.com/static/562a142fe4b0d8b406b73a30/5638a0dce4b0c0ca908149d9/5638a4ebe4b0a78fb6b8c612/1446552973380/Alameda-Food-Bank-Donartion-Logo.jpg"}
obj22 = Charity.find_by_id(23)
obj22.update_attributes(attributes22)

#23
attributes23 = {description: "ECAP’S mission is to provide food, household furnishings, care and compassion to those in need in Emeryville, California and the surrounding bay area communities. We believe food should always be available to everyone.", 
              url: "http://ecaprogram.org/", 
              image_url: "https://lh3.googleusercontent.com/-9my0jdI2rts/AAAAAAAAAAI/AAAAAAAAAAA/xKT0XFR57sI/photo.jpg"}
obj23 = Charity.find_by_id(24)
obj23.update_attributes(attributes23)

#24
attributes24 = {description: "Neighbors Helping Neighbors! This isn't a marketing slogan. It is what we do. We've been helping Pacifica residents since 1974. We work with businesses, organizations, and individuals in the neighborhood to provide food, housing assistance, and basic needs to our neighbors.", 
              url: "http://pacresourcecenter.org/blog/", 
              image_url: "http://kevinwacknov.com/wp-content/uploads/2011/08/prc_logo_vertical.png"}
obj24 = Charity.find_by_id(25)
obj24.update_attributes(attributes24)

#25
attributes25 = {description: "The San Francisco Department of Animal Care and Control is committed to the delivery of effective, courteous, and responsive animal care and control services to the residents of San Francisco. The Department is responsible for San Francisco's stray, injured, abandoned, neglected, and mistreated animals, as well as for the enforcement of all state and local Animal Control and Welfare laws.", 
              url: "http://sfgov.org/acc/", 
              image_url: "http://www.sfanimalcare.org/wp-content/themes/acc/images/logo1.png"}
obj25 = Charity.find_by_id(26)
obj25.update_attributes(attributes25)

#26
attributes26 = {description: "The mission of the San Francisco SPCA is to save and protect animals, provide care and treatment, advocate for their welfare and enhance the human-animal bond. As a result of our efforts and those of our community partners, San Francisco has the lowest euthanasia rate of any major city in the United States.", 
              url: "https://www.sfspca.org/", 
              image_url: "https://grishastewart.com/wp-content/uploads/2015/11/sfspcalogo.jpg"}
obj26 = Charity.find_by_id(27)
obj26.update_attributes(attributes26)

#27
attributes27 = {description: "Family Dog Rescue was founded in 2010 by Angela Padilla, a young mom battling breast cancer. As a grassroots-grown, 501c3 dog rescue organization, we save over 800 dogs per year from certain euthanasia and place them with loving families.", 
              url: "http://www.wearefamilydog.com/", 
              image_url: "https://media.licdn.com/media/p/8/005/0a3/2f7/31867d3.png"}
obj27 = Charity.find_by_id(28)
obj27.update_attributes(attributes27)

#28
attributes28 = {description: "Muttville’s mission is to change the way the world thinks about and treats older dogs and to create better lives for them through rescue, foster, adoption and hospice. We reach out to senior and special needs rescue dogs; find suitable homes for those dogs that are adoptable; and offer end of life care for those that are not.", 
              url: "http://www.muttville.org/", 
              image_url: "https://c676132.ssl.cf0.rackcdn.com/global_23015161-4e05073f3ec71.jpg"}
obj28 = Charity.find_by_id(29)
obj28.update_attributes(attributes28)

#29
attributes29 = {description: "We're an all-breed dog rescue based in the San Francisco Bay Area. All of our dogs live in foster homes until adopted - we don't have a physical shelter.", 
              url: "http://www.coppersdream.org/", 
              image_url: "http://maidenlanestudios.com/wp-content/uploads/2012/08/coppers-dream-rescue.png"}
obj29 = Charity.find_by_id(30)
obj29.update_attributes(attributes29)

#30
attributes30 = {description: "Wonder Dog Rescue is a community of volunteers committed to saving lives and finding adopters for vulnerable homeless dogs throughout Northern California. ", 
              url: "http://wonderdogrescue.org/", 
              image_url: "https://s3-media2.fl.yelpcdn.com/buphoto/e6PpiTI96kqbxDbKVtYHoQ/o.jpg"}
obj30 = Charity.find_by_id(31)
obj30.update_attributes(attributes30)

#31
attributes31 = {description: "Rocket Dog Rescue is a volunteer based organization serving the greater Bay Area, dedicated to saving homeless and abandoned dogs from over crowded animal shelters. We also help dogs from other areas that have compelling situations where they are in danger of abuse, neglect or euthanasia.", 
              url: "https://www.rocketdogrescue.org/", 
              image_url: "http://1.bp.blogspot.com/-jc-2gi3Zq7I/VPY1Wb4_QnI/AAAAAAAAB-I/n4My9RnU8JM/s1600/Rocket-Dog-Abandons-Pit-Bulls.png"}
obj31 = Charity.find_by_id(32)
obj31.update_attributes(attributes31)


#33
attributes33 = {description: "Park Animal Hospital has been voted the 'Best Veterinary Hospital in San Francisco' by the San Francisco Examiner and has been repeatedly recognized by the University of California at Davis for our participation in the Center for Companion Animal Health's 'Companion Animal Memorial Program.'", 
              url: "http://parkanimalvetsf.com/", 
              image_url: "http://m.parkanimalvetsf.com/img/logo.png"}
obj33 = Charity.find_by_id(34)
obj33.update_attributes(attributes33)


#35
attributes35 = {description: "Every day adult and senior cats with treatable medical and behavior conditions are euthanized. GIVE ME SHELTER's goal is to rescue these cats and place them into loving permanent homes.", 
              url: "http://www.givemesheltersf.org/", 
              image_url: "https://cdn.shopify.com/s/files/1/0601/4169/files/Give-Me-Shelter-Cat-Rescue.jpg?7739734515298532421"}
obj35 = Charity.find_by_id(36)
obj35.update_attributes(attributes35)

#36
attributes36 = {description: "Wonder Cat Rescue is a San Francisco-based non-profit organization devoted to rescuing needy kittens and cats from shelter euthanasia and abandonment. We are not a shelter, but a team of caring foster homes and volunteers who open our own homes to needy cats until permanent placement can be found.", 
              url: "http://wondercatrescue.org/", 
              image_url: "http://payload292.cargocollective.com/1/1/41112/8140939/wondercatlogo2.jpg"}
obj36 = Charity.find_by_id(37)
obj36.update_attributes(attributes36)

#37
attributes37 = {description: "Our Lab Rescue team saves purebred Labrador Retrievers and Lab mixes from shelters, as well as assists people giving up their dogs for adoption.  We provide foster homes, veterinary care, and rehabilitation when needed, and place them with loving, forever families.", 
              url: "http://www.labrescue.org/index.html", 
              image_url: "https://s-media-cache-ak0.pinimg.com/236x/23/aa/78/23aa78dc17a30788c7fe52c8a4d100a9.jpg"}
              phone: "+1-415-487-0691"
obj37 = Charity.find_by(name: "Golden Gate Labrador Retriever Rescue")
obj37.update_attributes(attributes37)

#38
attributes38 = {description: "", 
              url: "", 
              image_url: ""}
obj38 = Charity.find_by_id(39)
obj38.update_attributes(attributes38)

#39
attributes39 = {description: "Our ultimate goal is to rehabilitate cocker spaniels and find them a loving home.", 
              url: "http://www.baark.org/", 
              image_url: "http://www.baark.org/images/logo.gif"}
obj39 = Charity.find_by_id(40)
obj39.update_attributes(attributes39)

#40
attributes40 = {description: "To reduce the number of unwanted pit bulls in America’s high kill shelters through a program of love, healthy feeding and positive training.", 
              url: "http://www.reunionrescue.com/", 
              image_url: "https://s-media-cache-ak0.pinimg.com/236x/d1/19/9b/d1199bf042102887fc7385857addf91f.jpg"}
obj40 = Charity.find_by_id(41)
obj40.update_attributes(attributes40)

#41
attributes41 = {description: "Berkeley Humane serves the people and animals of our community by providing life-saving programs for cats and dogs, cultivating compassion, and strengthening the human-animal bond.", 
              url: "https://berkeleyhumane.org/", 
              image_url: "http://dogtrekker.com/userfiles//BerkeleyHumaneLogo.gif"}
obj41 = Charity.find_by_id(42)
obj41.update_attributes(attributes41)

#46
attributes46 = {description: "The Mission of the Center for Sex & Culture is to provide judgment-free education, cultural events, a library/media archive, and other resources to audiences across the sexual and gender spectrum; and to research and disseminate factual information, framing and informing issues of public policy and public health.", 
              url: "http://www.sexandculture.org/", 
              image_url: "http://www.kurzweilai.net/images/Center-for-Sex-and-Culture-logo.jpeg"}
obj46 = Charity.find_by_id(46)
obj46.update_attributes(attributes)

#47
attributes47 = {description: "MCCLA’S main objectives to present the best representative sample of contemporary and ancient artistic traditions of Latin America and to develop in the community a high degree of sensitivity and understanding of Latin American culture.", 
              url: "http://missionculturalcenter.org/", 
              image_url: "http://www.sfiaf-archive.org/placas/aboutsfiaf/logos/MCCLA-35-aniv.png"}
obj47 = Charity.find_by_id(47)
obj47.update_attributes(attributes47)

#48
attributes48 = {description: "CCC is a community-based arts nonprofit. Our work is based in Chinatown and San Francisco’s open and public spaces, and other art institutions. Our mission is  to spark intercultural discovery through art, education and engagement.", 
              url: "http://www.c-c-c.org/", 
              image_url: "http://www.visualartsource.com/ClientServices/3131/31311343944868-ccc-identity.jpg"}
obj48 = Charity.find_by_id(48)
obj48.update_attributes(attributes48)

#49
attributes49 = {description: "SEACHAMPA is a space dedicated to sharing cultures and heritage though and type of expression, whether it be through dance or through art. Our space first started our in Oakland and moved its way into the San Francisco area, working alongisde the likes of AsianWeek.", 
                url: "http://seachampa.org/about.html", 
                image_url: ""}
obj49 = Charity.find_by_id(49)
obj49.update_attributes(attributes49)

#51
attributes51 = {description: "Dedicated to sustaining and fostering the growth of cultural traditions, ACTA ensures that its core values of respect, cultural pluralism, and cultural democracy permeate every aspect of its activity and programming.  ACTA helps people connect to their past and keep traditions a central part of life today and tomorow.", 
                url: "http://www.arabculturalcenter.org/", 
                image_url: "http://www.ucarecdn.com/c4a36db1-d5d0-47b3-abde-1861c509ba31/-/preview/300x300/"}
obj51 = Charity.find_by_id(51)
obj51.update_attributes(attributes51)

#52
attributes52 = {description: "YBCA is a new kind of art center. One that expands and extends its impact beyond its walls. A center that convenes creative souls from all walks of life to instigate actions and spur movement that transform our cities and our lives.", 
                url: "https://www.ybca.org/", 
                image_url: "http://interaction15.ixda.org/wp-content/uploads/i15-partner-ybca-340x340.png"}
obj52 = Charity.find_by(name: "Yerba Buena Center For the Arts")
obj52.update_attributes(attributes52)

#53
attributes53 = {description: "Our mission is to empower our community through Afro-centric artistic and cultural expression, mediums, education and programming. We are dedicated to inspiring children and youth to serve as agents of change, cultivating their leadership skills and fostering a commitment to community service and activism.", 
                url: "http://www.aaacc.org/index.html", 
                image_url: "http://www.sfstation.com/images/bl/71/3571a_tn220x220.jpg"}
obj53 = Charity.find_by_id(53)
obj53.update_attributes(attributes53)

#54
attributes54 = {description: "The mission of the SF LGBT Center is to connect our diverse community to opportunities, resources and each other to achieve our vision of a stronger, healthier, and more equitable world for LGBT people and our allies.", 
                url: "http://www.sfcenter.org/", 
                image_url: "https://pbs.twimg.com/profile_images/760918286833811456/MPIkZXoN.jpg"}
obj54 = Charity.find_by_id(54)
obj54.update_attributes(attributes54)

#56
attributes56 = {description: "The Club’s mission is to serve as a center for the propagation of Polish culture, art, language and community.", 
                url: "http://www.polishclubsf.org/", 
                image_url: "http://www.polishclubsf.org/index_files/image003.png"}
obj56 = Charity.find_by_id(56)
obj56.update_attributes(attributes56)

#57
attributes57 = {description: "The Jazz Heritage Center (JHC) is the only permanent cultural and educational complex dedicated to the long history of Jazz in San Francisco and the Fillmore District.", 
                url: "https://www.sfjazz.org/content/jazz-heritage-center", 
                image_url: "http://www.fillmorestreetsf.com/wp-content/blogs.dir/276/files/2011/11/fillmore_logo_sm-copy-copy1.jpg"}
obj57 = Charity.find_by_id(57)
obj57.update_attributes(attributes57)

#58
attributes58 = {description: "We promote knowledge of the German language abroad and foster international cultural cooperation. We convey a comprehensive image of Germany by providing information about cultural, social and political life in our nation.", 
                url: "https://www.goethe.de/ins/us/en/index.html", 
                image_url: "https://pbs.twimg.com/profile_images/433691134708051969/ZQ__HUpz_400x400.png"}
obj58 = Charity.find_by(name: "Goethe Institut")
obj58.update_attributes(attributes58)

#59
attributes59 = {description: "The Filipino American Development Foundation exists to strengthen the social, physical, and economic well being of the Filipino American community and the South of Market community with special attention to the underserved segments of the community.", 
                url: "http://bayanihancc.org/", 
                image_url: "http://ppie.ae/wp-content/uploads/2016/07/bayanihan-council.jpg"}
obj59 = Charity.find_by(name: "Bayanihan Community Center")
obj59.update_attributes(attributes59)

#61
attributes61 = {description: "The mission of Manilatown Heritage Foundation is to promote social and economic justice for Filipinos in the United States by preserving our history, advocating for equal access, and advancing our arts and culture.", 
              url: "https://manilatown-heritage-foundation.org/", 
              image_url: "http://www.manilatown.org/images/mhflogomdcmp.gif"}
obj61 = Charity.find_by_id(61)
obj61.update_attributes(attributes61)

#63
attributes63 = {description: "Our mission is to promote cultural arts, community media, and civic engagement as a way of building healthy and empowered Latino communities.", 
              url: "http://accionlatina.org/en/", 
              image_url: "http://accionlatina.org/wp-content/uploads/2015/10/logo-3.png"}
obj63 = Charity.find_by_id(63)
obj63.update_attributes(attributes63)

#64
attributes64 = {description: "The Book Club of California is a non-profit membership organization founded in 1912. It supports the art of fine printing related to the history and literature of California and the western states of America through research, publishing, public programs, and exhibitions.", 
              url: "http://www.bccbooks.org/", 
              image_url: "http://www.bccbooks.org/wp-content/themes/bookclub_child_theme/images/BCC_PressMark.png"}
obj64 = Charity.find_by(name: "Book Club of California")
obj64.update_attributes(attributes64)

#65
attributes65 = {description: "We inspire and enable all young people, especially those from disadvantaged circumstances, to realize their full potential as productive, responsible and caring citizens.", 
              url: "http://www.kidsclub.org/about-us/", 
              image_url: "http://www.bgcacadiana.com/wp-content/uploads/2015/04/lft_clubs_blu.jpg"}
obj65 = Charity.find_by_id(65)
obj65.update_attributes(attributes65)


































