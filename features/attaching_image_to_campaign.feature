@javascript
Feature: Attaching image to the campaign 
    As an Artist
    To further promote my Campaign
    I would like to be able to attach an image to my Campaign

    Background:
        Given the following user exist
        | email          | role   | password   |
        | user@artist.se | artist | my-pasword |
        And I am logged in as 'user@artist.se'

    Scenario: Attaching image to the campaign
        And I am on the 'landing' page
        And I click on 'New Campaign'
        Then I should see the 'Create a New Campaign' form
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I attach an image to the campaign
        And I click on 'Launch Campaign'
        And I wait 1 second
        Then I should be redirected to the Campaign page for 'Clare Cunningham'
        And I should see the 'dummy.jpg' image