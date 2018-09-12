Given('I am on the {string} page') do |page_name|
  visit page_path(page_name)
end

def page_path(path)
  if path == 'Create Campaign'
    new_campaign_path
  elsif path == 'Campaigns'
    campaigns_path
  elsif path == 'Create Artist Profile'
    new_performer_path
  elsif path == 'Performers'
    performers_path
  else
    root_path
  end
end

Given('I try to access {string} page') do |page_name|
  visit page_path(page_name)
end

Given("I am on the Campaign page for {string}") do |campaign_title|
  campaign_page = Campaign.find_by(title: campaign_title)
  visit campaign_path(campaign_page)
end

When("I am on the Performer page for {string}") do |performer_name|
  performer = Performer.find_by(name: performer_name)
  visit performer_path(performer)
end