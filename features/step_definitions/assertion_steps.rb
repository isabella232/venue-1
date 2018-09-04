Then("I should see {string}") do |content|
    expect(page).to have_content content
end

Then("the location is {string}") do |city|
    expect(page).to have_content city
end