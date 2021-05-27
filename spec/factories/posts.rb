FactoryBot.define do
  factory :post do
    title             { '熱海マンション' }
    station           { '熱海駅' }
    price             { 60_000 }
    access            { '徒歩28分' }
    describe          { '家具完備' }

    association :owner

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
