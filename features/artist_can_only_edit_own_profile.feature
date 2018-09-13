@javascript
Feature: Artist can only edit own Artist profile
    As a system owner
    In order to relieve myself from keeping the artists profiles up to date
    I would like to allow Artists to update their profile

    Background: 
        Given the following users exist
        | email          | role   |
        | kanye@venue.se | artist |
        | jay@venue.se   | artist |
        And the following Performer with name exist
        | name  | user         |
        | Jay-Z | jay@venue.se |

    Scenario: Jay can edit Jay's artist profile
        Given I am logged in as 'jay@venue.se'
        And I am on the Performer page for 'Jay-Z'
        And I click on 'Edit'
        And I fill in 'Artist name' with 'Beyonce'
        And I click 'Update Profile'
        And I wait 1 second
        Then I should see 'Profile has been successfully updated'
        And there should be a Artists Profile titled 'Beyonce' in the Database
        And I should be redirected to the Artist page for 'Beyonce'

    Scenario: Kayne can NOT edit Jay's artist profile 1
        Given I am logged in as 'kanye@venue.se'
        And I am on the Performer page for 'Jay-Z'
        And I should NOT see 'Edit'

    Scenario: Kayne can NOT edit Jay's artist profile 2
        Given I am logged in as 'kanye@venue.se'
        And I am on the Performer page for 'Jay-Z'
        And I try to access the Edit Performer page for 'Jay-Z'
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page