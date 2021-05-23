FactoryBot.define do
  factory :user do
    name                    {Faker::Name.name}
    age                     {'34'}
    email                   {Faker::Internet.free_email}
    password                {'1a' + Faker::Internet.password}
    password_confirmation   {password}
  end
end
