FactoryBot.define do
  factory :campaign do
    title { "MyString" }
    description { "MyText" }
    location { "MyString" }
    user
  end
end
