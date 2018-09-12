Feature: Add sold ticket counter
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

    Scenario:
        When I click on 'Veronica Maggio in Stockholm' detail box
        Then I should see '300/300'
        And I click on 'Buy your ticket'
        And I should see "1 ticket" in header
        And I should see '299/300'