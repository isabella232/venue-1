FactoryBot.define do
  factory :user do
    sequence(:email) {|u| "mikael#{u}@test.com"}    
    password { 'my-password' }
  end
end
