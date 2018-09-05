Given("the following campaign exist(s)") do |table|
    table.hashes.each do |campaign_hash|
        create(:campaign, campaign_hash)
    end
end
  