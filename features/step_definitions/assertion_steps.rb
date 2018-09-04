Then("I should be redirected to the Create New Campaign page") do
    expect(current_path).to eq new_campaign_path
end

Then("there should be a Campaign titled {string} in the Database") do |string|
    pending # Write code here that turns the phrase above into concrete actions
end