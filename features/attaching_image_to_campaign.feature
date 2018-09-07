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
        And I see 'Upload a campaign photo'
        And I attach an image-file
        And I should see the 'dummy.jpg' image
        And I click on 'Launch Campaign'
        Then I should be on 'Clare Cunningham' campaign page

    