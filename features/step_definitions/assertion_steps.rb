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
