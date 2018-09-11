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
        | title                        | description                                | location  | state    |
        | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | accepted |

        Given the following tickets for 'Veronica Maggio in Stockholm' exist
        | name        | price |
        | Sure thing  | 200   |

        And I am logged in as 'user@artist.se'
        And I am on the 'landing' page

    Scenario:
        When I click on 'Veronica Maggio in Stockholm' detail box
        And I click on 'Buy your ticket'
        Then I wait 1 second
        Then I should see "Your ticket has been added to your order."
        And the last order in the database should include "Sure thing"
