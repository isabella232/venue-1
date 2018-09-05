<<<<<<< HEAD
Then("I should see {string}") do |content|
    expect(page).to have_content content
end

Then("the location is {string}") do |city|
    expect(page).to have_content city
end
=======
Then("I should be redirected to the Create New Campaign page") do
    expect(current_path).to eq new_campaign_path
end

Then("there should be a Campaign titled {string} in the Database") do |expected_title|
    campaign = Campaign.find_by(title: expected_title)
    expect(campaign).not_to eq nil
end
>>>>>>> fc71b25ae6df90e7bdc4c1b7bd2169fa561078a0
