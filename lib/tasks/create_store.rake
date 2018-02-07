namespace :create_store do
  desc "create store"
  task create_store: :environment do
    Store.create!(name: "Found Sound", address:"1773 17th st Denver,CO 80202", status:"active")
  end

end
