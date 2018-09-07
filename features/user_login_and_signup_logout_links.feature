@javascript
Feature: Sign out link only visible when logged in
    As a DevTeam, 
    In order to provide a flawless experience to our users, 
    We would like to have Log out link and hide Sign up link nav bar. 

    Background: 
        Given the following user exist
        | email           | password    | role   |
        | artist@venue.se | my-password | artist |

    Scenario:
        Given I am on the 'landing' page
        Then I should see 'LOG IN'
        And I should see 'SIGN UP'
        And I should NOT see 'LOG OUT'
        Then I click on 'Log in'
        And I wait 1 second
        Then I fill in 'Email address' with 'artist@venue.se'
        And I fill in 'Password' with 'my-password'
        And I click on 'Login'
        And I wait 1 second
        Then I should see 'LOG OUT'
        And I should NOT see 'LOG IN'
        And I should NOT see 'SIGN UP'