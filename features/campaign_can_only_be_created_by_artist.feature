@javascript
Feature: A Campaign can only be created by an Artist
    As a System owner,
    In order to eliminate fake and non-serious Campaigns
    We would like the Campaigns to only be created by Artists.

    Background:
        Given the following users exist
            | email          | role   |
            | user@fan.se    | fan    |
            | user@artist.se | artist |

    Scenario: Fan tries to access Create Campaign page via link
        Given I am logged in as 'user@fan.se'
        And I try to access 'Create Campaign' page
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page

    Scenario: Fan should not see Create Campaign link on landing page
        Given I am logged in as 'user@fan.se'
        And I am on the 'Create Campaign' page
        Then I should NOT see 'New Campaign'

    Scenario: Artist tries to access Create Campaign page
        Given I am logged in as 'user@artist.se'
        And I am on the 'landing' page
        When I click on 'New Campaign'
        And I wait 1 second
        Then I should see the 'Create Campaign' form