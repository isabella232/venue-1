@javascript
Feature: Visitor can read Terms of use 
    As a Visitor
    In order to know more about Venue
    I would like to be able to read some more information
    Scenario: 
        Given I am on the 'landing' page
        And I click on 'About Venue'
        Then I should see 'About us'