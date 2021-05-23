FactoryBot.define do
  factory :owner do
    name                    {Faker::Name.name}
    age                     {'24'}
    email                   {Faker::Internet.free_email}
    password                {'1a' + Faker::Internet.password}
    password_confirmation   {password}
  end
end
