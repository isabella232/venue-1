Feature: A Campaign can only be created by an Artist
    As a System owner, 
    In order to eliminate fake and non-serious Campaigns
    We would like the Campaigns to only be created by Artists.

    Background:
        Given the following users exist
        |email              |role       |
        |user@user.se       |artist     |

     
     Scenario: User tries to access Create Campaign page
        When I am logged in as 'user@user.se'
        And I am on the 'Campaign page' page
        Then I should see 'Access denied'
        And I then 
     Scenario: Subscriber tries to access Create Article page
        When I am logged in as 'subscriber@user.se'
        And I am on the 'Create Article' page
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page
     Scenario: Author tries to access Create Article page
        When I am logged in as 'author@user.se'
        And I am on the 'Landing' page
        And I click on 'New Article'
        Then I should be redirected to the 'Create Article' page
     Scenario: Editor tries to access Create Article page
        When I am logged in as 'editor@user.se'
        And I am on the 'Landing' page
        And I click on 'New Article'
        And I should be redirected to the 'Create Article' page 
