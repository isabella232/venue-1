@javascript
Feature: Implement the payment method for tickets
    As a system owner
    In order to increase the revenue flow
    I would like to charge money for tickets

    Background: 
        Given the following user exist
        | email          | role   | password   |
        | user@artist.se | fan    | my-pasword |
        And I am logged in as 'user@artist.se'
        And I am on the 'Campaign' page
        And I click on 'Buy your ticket'
        And I click on 'Pay with Card' stripe button
        And I fill in the stripe field 'Card number' with '4242 4242 4242 4242'
        And I fill in the stripe field 'CVC' with '123'
        And I fill in the stripe field 'Expiry' with '12/20'
        And I submit the stripe form
        Then I should be on the 'Campaign' page
        And I should see 'Your payment was succesfull'
