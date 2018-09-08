FactoryBot.define do
  factory :ticket do
    price { 0 }
    campaign
    name { 'MyString' }
  end
end
