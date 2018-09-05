And ("I click on {string}") do |link|
    click_on link
end

Then("I fill in {string} with {string}") do |field, content|
    fill_in field, with: content
end

And("I wait {int} second(s)") do |seconds|
    sleep seconds
end

And("stop") do  
    binding.pry
end
