Then("I should see {string}") do |content|
    expect(page).to have_content content
end

Then("there should be a Campaign titled {string} in the Database") do |expected_title|
    campaign = Campaign.find_by(title: expected_title)
    expect(campaign).not_to eq nil
end

Then("It should be a user in the database with the email {string}") do |expected_email|
    user = User.find_by(email: expected_email)
    expect(user.email).to eq expected_email
end