@javascript
Feature: Guest can create a new Campaign
    As a Guest,
    In order to bring the Artists to my city
    I would like to create a Campaign

    Scenario: Guest successfully create a new Campaign
        Given I am on the 'landing' page
        And I click 'New Campaign'
        Then I should be redirected to the 'create new campaign' page
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I click 'Launch Campaign'
        Then there should be a Article titled 'Clare Cunningham' in the Database
