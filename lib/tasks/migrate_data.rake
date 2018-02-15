namespace :migrate_data do

  desc "create store"
  task create_stores: :environment do
    Store.create(name: "Found Sound", address:"1773 17th st Denver,CO 80202", status:"active")
    Store.create(name: "Sam's Smoke Shack", address:"1234 17th st Denver,CO 80202", status:"active")
    Store.create(name: "Vintage Beats", address:"2345 17th st Denver,CO 80202", status:"active")
    Store.create(name: "California Used Equipment", address:"3456 17th st Denver,CO 80202", status:"active")
  end

  desc "add_store_id_to_items"
  task add_store_id_to_items: :environment do
    Item.where(store: nil).each{|item| item.update_attributes(store_id: Store.first.id)}
  end

  desc "change item image from local storage to cloud storage"
  task set_default_image: :environment do
    Item.where(image: nil).each do |item|
      item.update_attributes(image: 'http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png')
      puts "#{item.title} Updated"
    end
  end

  desc "add order total price to all orders"
  task calculate_order_total: :environment do
    Order.where(total_price: nil).each do |order|
      order.calculate_total
    end
  end

  desc "create departments"
  task create_departments: :environment do
    books = Department.create!(title: "Books")
    books.categories << Category.all

    instruments = Department.create(title: "Instruments")
    strings = Category.create(title: "String")
    percussion = Category.create(title: "Percussion")
    brass = Category.create(title: "Brass")
    woodwind = Category.create(title: "Woodwind")
    instruments.categories << [strings, percussion, brass, woodwind]

    records = Department.create(title: "Vinyl")
    jazz = Category.create(title: "Jazz")
    classic_rock = Category.create(title: "Classic Rock")
    punk_rock = Category.create(title: "Punk Rock")
    hiphop = Category.create(title: "Hip Hop")
    funk = Category.create(title: "Funk")
    records.categories << [jazz, classic_rock, punk_rock, hiphop, funk]

    equipment = Department.create(title: "Equipment")
    amps = Category.create(title: "Amplifiers")
    speakers = Category.create(title: "Speakers")
    turntables = Category.create(title: "Turn Tables")
    microphones = Category.create(title: "Microphones")
    equipment.categories << [amps, speakers, turntables, microphones]
  end

  desc "create items for the departments"
  task add_department_items: :environment do
    strings = Category.find_by(title: "String")
    percussion = Category.find_by(title: "Percussion")
    brass = Category.find_by(title: "Brass")
    woodwind = Category.find_by(title: "Woodwind")

    jazz = Category.find_by(title: "Jazz")
    classic_rock = Category.find_by(title: "Classic Rock")
    punk_rock = Category.find_by(title: "Punk Rock")
    hiphop = Category.find_by(title: "Hip Hop")
    funk = Category.find_by(title: "Funk")

    amps = Category.find_by(title: "Amplifiers")
    speakers = Category.find_by(title: "Speakers")
    turntables = Category.find_by(title: "Turn Tables")
    microphones = Category.find_by(title: "Microphones")

    5.times do
      Item.create(title: "#{Faker::Color.color_name} Flute", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518479957/wzcbhniq6wh9rhiqbyzn.jpg", store: Store.where.not(slug: "found-sound").sample, category: woodwind)
      Item.create(title: "#{Faker::Color.color_name} Guitar", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480006/ozhnmaccv60na3rnb4o9.jpg", store: Store.where.not(slug: "found-sound").sample, category: strings)
      Item.create(title: "#{Faker::Color.color_name} Drum Set", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480040/etjbimnu52cxeejnx7oz.jpg", store: Store.where.not(slug: "found-sound").sample, category: percussion)
      Item.create(title: "#{Faker::Color.color_name} Trumpet", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image:  "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518481789/yq8xfl3qpzboi0ntcwi4.jpg", store: Store.where.not(slug: "found-sound").sample, category: brass)
    end

    5.times do |time|
      Item.create(title: "Now That's What I Call Jazz #{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg", store: Store.where.not(slug: "found-sound").sample, category: jazz)
      Item.create(title: "Now That's What I Call Classic Rock #{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg", store: Store.where.not(slug: "found-sound").sample, category: classic_rock)
      Item.create(title: "Now That's What I Call Punk Rock #{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg", store: Store.where.not(slug: "found-sound").sample, category: punk_rock)
      Item.create(title: "Now That's What I Call Hip Hop #{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg", store: Store.where.not(slug: "found-sound").sample, category: hiphop)
      Item.create(title: "Now That's What I Call Funk #{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480069/kssxvp0dgo5c1gqecm5o.jpg", store: Store.where.not(slug: "found-sound").sample, category: funk)
    end

    5.times do |time|
      Item.create(title: "Big Ass Amp V#{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480098/pp7rlicexfxovpbl7m0c.jpg", store: Store.where.not(slug: "found-sound").sample, category: amps)
      Item.create(title: "Loud F-ing Speakers V#{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480123/awel0ebqhuj1civcdzcr.jpg", store: Store.where.not(slug: "found-sound").sample, category: speakers)
      Item.create(title: "Premium DJ Turntable V#{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480148/exhahnivcutz48gpcldp.jpg", store: Store.where.not(slug: "found-sound").sample, category: turntables)
      Item.create(title: "Justin Beiber Mic #{time}", description: "#{Faker::Hipster.sentences(2)}", price: rand(0..100000)/100.00, image: "http://res.cloudinary.com/dhzyzerqn/image/upload/v1518480170/hymq3fyjg9vhggxbmrcs.jpg", store: Store.where.not(slug: "found-sound").sample, category: microphones)
    end
  end
end
