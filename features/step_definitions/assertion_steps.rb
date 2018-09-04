Then("I should be redirected to the Create New Campaign page") do
    expect(current_path).to eq new_campaign_path
end

Then("there should be a Campaign titled {string} in the Database") do |expected_title|
    expect(Campaign.last.title).to eq expected_title
end