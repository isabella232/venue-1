FactoryBot.define do
  factory :ticket do
    price { 0 }
    campaign
    name { 'MyString' }
    count { 200 }
    increasing_count { 0 }
  end
end
