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
        And I fill in 'Artist name' with 'Jay-Z'
        And I fill in 'Genre' with 'Hip-Hop'
        And I fill in 'City' with 'New York City'
        And I fill in 'Artist Description' with 'Born in Atalanta, raised in Chicago'
        And I fill in 'Facebook' with 'https://www.facebook.com/Jay-Z/'
        And I fill in 'Instagram' with 'https://www.instagram.com/Jay-Z'
        And I fill in 'Twitter' with 'https://twitter.com/Jay-Z'
        And I fill in 'Youtube' with 'https://www.youtube.com/'
        And I fill in 'Website' with 'https://www.Jay-Z.com/'
        And I fill in 'Spotify' with 'https://open.spotify.com/artist/Jay-Z'
        And I click 'Update Profile'
        And I wait 1 second
        Then I should see 'Profile has been successfullu updated'
        And there should be a Artists Profile titled 'Jay-Z' in the Database
        And I should be redirected to the Artist page for 'Jay-Z'