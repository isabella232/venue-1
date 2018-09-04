Given("the following campaign exists") do |table|
    table.hashes.each do |campaign_hash|
        create(:campaign, campaign_hash)
  end
end
  