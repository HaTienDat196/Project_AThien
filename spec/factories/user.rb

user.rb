FactoryGirl.define do
  factory :user do
    username    Faker::Name.name
    email       Faker::Internet.email
    birth       Faker::Date.birthday(18, 65)
    avatar 'product-01.jpg'
  end
end
