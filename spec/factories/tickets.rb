FactoryBot.define do
  factory :ticket do
    price { 0 }
    campaign
    count { 200 }
    sold_count { 0 }
  end
end
