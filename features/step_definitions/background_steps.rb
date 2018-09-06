Given("the following campaign exist(s)") do |table|
    table.hashes.each do |campaign_hash|
        create(:campaign, campaign_hash)
    end
end

Given("the following user(s) exist") do |table|
    table.hashes.each do |user_hash|
        create(:user, user_hash)
    end
end
  
Given("I am logged in as {string}") do |email|
    @user = User.find_by(email: email)
    login_as(@user, scope: :user)
end
  
Given("the facebook authentication is not granted") do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end
  