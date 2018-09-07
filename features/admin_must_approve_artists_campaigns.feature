@javascript
Feature: Admin must approve Artists new Campaigns
    As a system owner
    In order to be in control of the applications content
    I would like to be able to approve all new content created by the Artists

    Background:
        Given the following user exist
            | email           | role   |
            | admin@venue.se  | admin  |
        And the following campaign exist
            | title                        | description                                | location  | state   |
            | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | pending |
    
    Scenario: Artist creates a Campaign and Admin approves it
        Given I am logged in as 'artist@venue.se'
        And I am on the 'Campaigns' page
        Then stop
        Then I should see 'Veronica Maggio in Stockholm'
        And the state of the campaign 'Veronica Maggio in Stockholm' should be 'pending'
        And I should see 'Reject'
        And I should see 'Accept'
        When I click on 'Accept'
        Then the state of the campaign 'Veronica Maggio in Stockholm' should be 'accepted'