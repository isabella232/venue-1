@javascript
Feature: Implement the payment method for tickets
    As a system owner
    In order to increase the revenue flow
    I would like to charge money for tickets

    Background: 
        Given the following user exist
        | email          | role   | password   |
        | user@artist.se | fan    | my-pasword |

        Given the following campaign exist
        | title                        | description                                | location  |
        | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm |
        And I am logged in as 'user@artist.se'
        And I am on the 'landing' page

    Scenario:
        When I click on 'Veronica Maggio in Stockholm' detail box
        Then I should be redirected to the Campaign page for 'Veronica Maggio in Stockholm'
        And I click on 'Buy your ticket'
        And I click on 'Pay with Card' stripe button
        And I fill in the stripe field 'Card number' with '4242 4242 4242 4242'
        And I fill in the stripe field 'CVC' with '123'
        And I fill in the stripe field 'Expiry' with '12/20'
        And I submit the stripe form
        Then I should be on the 'Campaign' page
        And I should see 'Your payment was succesfull'
