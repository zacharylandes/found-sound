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
    Item.all.each{|item| item.update_attributes(store_id: Store.first.id)}
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
end
