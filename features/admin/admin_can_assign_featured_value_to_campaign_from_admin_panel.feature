@javascript
Feature: Guests can view the list of Campaigns on the landing page
    As an Admin
    In order to promote certain Campaigns
    I would like to be able to choose specific feature campaigns
    ´

    Background:
        Given the following campaign exist
            | title                        | state    | featured |
            | Veronica Maggio in Stockholm | accepted | false    |
            | Another Artist in Stockholm  | pending  | false    |
            | Special Campaign             | pending  | false    |

    Scenario:
        When I am on the 'admin' page
        And I click "List campaigns"
        Then I should see "Testing to render"
