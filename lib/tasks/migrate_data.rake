namespace :migrate_data do
  
  desc "create store"
  task create_store: :environment do
    Store.create!(name: "Found Sound", address:"1773 17th st Denver,CO 80202", status:"active")
  end

  desc "add_store_id_to_items"
  task add_store_id_to_items: :environment do
    Item.all.each{|item| item.update_attributes(store_id: Store.first.id)}
  end

end
