FactoryBot.define do
  factory :post do
    place { Faker::Food.dish }
    time { Faker::Food.dish }
    more { Faker::Food.description }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
