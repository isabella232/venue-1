@javascript
Feature: Artist can add information to profile
    As an Artist, 
    In order to promote my music,
    I would like to create my Artist profile page.

    Background:
        Given the following users exist   
        | email           | role   |
        | mikael@venue.se | artist |
        And I am logged in as 'mikael@venue.se'

    Scenario:
        When I am on the 'landing' page
        And I click on 'Edit Profile'
        #Then I should be redirected to the 'Edit Profile' page
        #And I should see 'Create your Artist profile'
        And I fill in 'Artist name' with 'Kanye West'
        And I fill in 'Genre' with 'Hip-Hop'
        And I fill in 'City' with 'Los Angeles'
        And I fill in 'Artist Description' with 'Born in Atalanta, raised in Chicago'
        And I fill in 'Facebook' with 'https://www.facebook.com/TheKanyewestPage/'
        And I fill in 'Instagram' with '@kanyewestt_official'
        And I fill in 'Twitter' with '@kanyewest'
        And I fill in 'Website' with 'kanyewest.com'
        And I fill in 'Spotify' with 'https://open.spotify.com/artist/5K4W6rqBFWDnAN6FQUkS6x?si=4zpontE-TrmF46FSVJcNHA'
        And I click on 'Create Profile'
        Then my profile should have been created
