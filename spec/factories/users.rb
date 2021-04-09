FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    time { Faker::Name.last_name }
    place { Faker::Name.last_name }
    profile { Faker::Name.last_name }
  end
end
