namespace :add_store_id_to_items do
  desc "add_store_id_to_items"
  task add_store_id_to_items: :environment do
    Item.all.each{|item| item.update_attributes(store_id: Store.first.id)}
  end
end
