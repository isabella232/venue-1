@javascript
Feature: Admin can edit Artist-profiles
    As an Admin
    In order to keep the quality of the Artist profiles high
    I would like to be able to edit Artist profile

    Background:
        Given the following Performer exist
        | name       |
        | Kanye West |
        Given the following user exist
        | email          | role  |
        | admin@venue.se | admin |
        And I am logged in as 'admin@venue.se'

    Scenario: Admin edits Artists Profile page
        When I am on the Artists Proile page for 'Kanye West'
        And I click on 'Edit'
        Then I should be redirected to the Edit page for Artist 'Kanye West'
        And I fill in 'Title' with 'Jay-Z'
        And I click 'Update profile'
        And I wait 1 second
        Then I should see 'Profile has been successfullu updated'
        And there should be a Artists Profile titled 'Jay-Z' in the Database
        And I should be redirected to the Artist for 'Jay-Z'