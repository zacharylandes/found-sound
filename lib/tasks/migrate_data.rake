namespace :migrate_data do

  desc "create store"
  task create_stores: :environment do
    Store.create!(name: "Found Sound", address:"1773 17th st Denver,CO 80202", status:"active")
    Store.create!(name: "Records", address:"1234 17th st Denver,CO 80202", status:"active")
    Store.create!(name: "Instruments", address:"2345 17th st Denver,CO 80202", status:"active")
    Store.create!(name: "Amps", address:"3456 17th st Denver,CO 80202", status:"active")
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

end
