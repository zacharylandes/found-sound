FactoryBot.define do
  factory :store do
    sequence(:name) {|n| "Store #{n}" }
    address "1773 17th st denver co 80202"
    status "active"
  end
end
