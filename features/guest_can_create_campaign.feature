@javascript
Feature: Guest can create a new Campaign
    As a Guest,
    In order to bring the Artists to my city
    I would like to create a Campaign

    Background:
        Given the following user exist
        |email          |password   |
        |mikael@venue.se|my-password|
    
    Scenario: Registered User successfully create a new Campaign
        Given I am on the 'landing' page
        And I am logged in as 'mikael@venue.se'
        And I click on 'New Campaign'
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I click on 'Launch Campaign'
        Then there should be a Campaign titled 'Clare Cunningham' in the Database

    Scenario: Guest tries to create a new Campaign
        Given I am on the 'landing' page
        And I click on 'New Campaign'
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I click on 'Launch Campaign'
        Then I should see 'You need to sign in or sign up before continuing.'
