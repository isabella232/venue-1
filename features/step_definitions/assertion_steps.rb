<<<<<<< HEAD
When("I click on {string}") do |link|
    click_on link
end

Then("I should see {string}") do |content|
    expect(page).to have_content content
end

When("I am redirected to {string} page") do |string|
pending # Write code here that turns the phrase above into concrete actions
end

When("I should see {string}") do |string|
pending # Write code here that turns the phrase above into concrete actions
end

When("I fill in {string} field with {string}") do |string, string2|
pending # Write code here that turns the phrase above into concrete actions
end

Then("I should see {string}") do |string|
pending # Write code here that turns the phrase above into concrete actions
end
=======


Then("I should be redirected to the Create New Campaign page") do
    expect(current_path).to eq new_campaign_path
end

Then("there should be a Campaign titled {string} in the Database") do |expected_title|
    campaign = Campaign.find_by(title: expected_title)
    expect(campaign).not_to eq nil
end

Then ('I should see {string}') do |content|
    expect(page).to have_content content
end
>>>>>>> cfaf6def2f88f72b6a077f569fd10b7ff6d04a18
