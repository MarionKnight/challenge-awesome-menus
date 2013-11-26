FactoryGirl.define do
  factory :menu do
    name { Faker::Lorem.word }
  end

  factory :menu_item do
    menu
    name { Faker::Lorem.word }
    price { "1.00" }
  end
end
