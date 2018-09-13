@javascript
Feature: Artist has genres
    As an Artist
    In order to promote myself
    I would like to be able to add Genres to my profile
     
     Background:
        Given the following user exist
        | email           | role   | password   |
        | artist@venue.se | artist | my-pasword |
        And the following genres exist
        | name |
        | rock |
        | pop  |
        And I am logged in as 'artist@venue.se'
     
     Scenario: Campaign has genres
        And I am on the 'landing' page
        And I click on 'New Campaign'
        Then I should see the 'Create a New Campaign' form
        And I fill in 'Title' with 'Clare Cunningham'
        And I fill in 'Description' with 'Dubbed as having a vocal register similar to Adele'
        And I fill in 'Location' with 'Stockholm'
        And I select 'Pop' as genre
        And I select 'Rock' as genre
        And I attach an image to the campaign
        And I click on 'Launch Campaign'
        When I wait 1 second
        Then I should be on 'Clare Cunningham' campaign page
        And I should see 'Pop'
        And I should see 'Rock'