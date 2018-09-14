@javascript
Feature: Guest can login to the service
    As a Guest,
    In order to support the campaigns,
    I would like to login to the service

    PT story: https://www.pivotaltracker.com/story/show/160308818

    Background:
        Given the following user exist
            | email           | password |
            | thomas@venue.se | password |

    Scenario: Guest can login to the service [Happy path]
        Given I am on the 'landing' page
        And I click on 'Log in'
        And I wait 1 second
        And I fill in 'Email address' with 'thomas@venue.se'
        And I fill in 'Password' with 'password'
        And I click on 'Login'
        Then I should see 'Signed in successfully.'

