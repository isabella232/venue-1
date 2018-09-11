# frozen_string_literal: true

And ('I click( on) {string}') do |link|
  click_on link
end

And ('I click( on) {string} detail box') do |campaign_title|
  campaign = Campaign.find_by(title: campaign_title)
  find("##{ActionView::RecordIdentifier.dom_id(campaign)}").click
end

Then('I fill in {string} with {string}') do |field, content|
  fill_in field, with: content
end

And('I wait {int} second(s)') do |seconds|
  sleep seconds
end

And('stop') do
  binding.pry
end

And('I attach an image to the campaign') do
  attach_file('campaign_image', "#{::Rails.root}/spec/fixtures/dummy.jpg")
end

And('I fill in ticket fields') do 
  steps %q(
    And I fill in 'Fixed ticket price' with '100'
    And I fill in 'Ticket name' with 'Sure thing'
  )
end

When("I click on {string} stripe button") do |button|
  click_button button
  sleep 2
  @stripe_iframe= all(iframe[name=stripe_checkout_app]).last
end

When("I submit the stripe form") do
  within_frame @stripe_iframe do
    find('.Section-button').click
  end
end

And ("I click on {string} in the confirmation popup") do |string|
  page.driver.browser.switch_to.alert.accept
end

When("I click on {string} in header") do |link|
  within('#header') do
    click_on link
  end
end

Then("I fill in the stripe form field {string} with {string}") do |field_label, content|
  within_frame @stripe_iframe do
    fill_in field_label, with: content
  end
end