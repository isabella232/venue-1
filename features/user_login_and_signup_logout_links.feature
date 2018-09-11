@javascript
Feature: Sign out link only visible when logged in
    As a DevTeam, 
    In order to provide a flawless experience to our users, 
    We would like to have Log out link and hide Sign up link nav bar. 

    Background: 
        Given the following user exist
        | email           |
        | artist@venue.se |

    Scenario:
        Given I am on the 'landing' page
        Then I should see 'Log in'
        And I should see 'Sign up'
        And I should NOT see 'Log out'
        Then I click on 'Log in'
        And I wait 1 second
        Then I fill in 'Email address' with 'artist@venue.se'
        And I fill in 'Password' with 'my-password'
        And I click on 'Login'
        And I wait 1 second
        Then I should see 'Log out'
        And I should NOT see 'Log in'
        And I should NOT see 'Sign up'