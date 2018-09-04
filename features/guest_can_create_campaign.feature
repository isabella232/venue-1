Feature: Guest can create a new Campaign
    As a Guest,
    In order to bring the Artists to my city
    I would like to create a Campaign

    Scenario: Guest successfully create a new Campaign
        Given I am on the landing page
        And I click on 'New Campaign'
        Then I should be redirected to the Create New Campaign page
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I click on 'Launch Campaign'
        Then there should be a Campaign titled 'Clare Cunningham' in the Database
