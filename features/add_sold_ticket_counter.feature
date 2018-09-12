@javascript
Feature: Add sold ticket counter to Campaign page
    As an Artist
    In order to know how many Tickets that has been sold
    I would like to have a sold ticket-counter on the Campaign page

    Background:
        Given the following campaign exist
        | title                        | description                                | location  | state    |
        | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | accepted |

        Given the following tickets for 'Veronica Maggio in Stockholm' exist
        | name        | price |
        | Sure thing  | 200   |

        Given the following users exist
        | email           | role   |
        | mikael@venue.se | artist |
        And I am logged in as 'mikael@venue.se'
        And I am on the 'landing' page

    Scenario:
        When I click on 'Veronica Maggio in Stockholm' detail box
        Then I should see '0/200'
        And I click on 'Buy your ticket'
        And I should see "1 ticket" in header
        Then I click on '1 ticket' in header
        And I should see 'You are about to order: 1 ticket to Veronica Maggio in Stockholm'
        Then I fill in the stripe form
        And I wait 2 seconds
        And I click on 'Submit Payment'
        And I wait 5 seconds
        Then I should see "You rock!"
        And I should see '1/200'