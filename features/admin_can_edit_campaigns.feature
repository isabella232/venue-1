@javascript
Feature: Admin can edit Campaigns
    As an Admin
    In order to be in control of the content of the Campaigns and maintain a high quality
    I would like to be able to Edit existing Campaigns

    Background:
        Given the following campaign exist
        | title                        |
        | Veronica Maggio in Stockholm |
        And the following user exist
        | email         | role  |
        | admin@venue.se| admin |
        And I am logged in as 'admin@venue.se'

    Scenario: Admin can edit Campaign
        When I am on the Campaign page for 'Veronica Maggio in Stockholm'
        And I click on 'Edit'
        And I fill in 'Title' with 'Veronica Maggio in Oslo'
        And I fill in 'Description' with 'I have moved to Oslo'
        And I fill in 'Location' with 'Oslo'
        And I click 'Update Campaign'
        And I wait 1 second
        And I should see 'Campaign has been successfully updated'
        Then there should be a Campaign titled 'Veronica Maggio in Oslo' in the Database
        And I should be redirected to the Campaign page for 'Veronica Maggio in Oslo'
