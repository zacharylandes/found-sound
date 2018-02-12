FactoryBot.define do
  factory :store_order do
    order nil
    store nil
    status "MyString"
    total_price 1
  end
end
