@javascript
Feature: Admin can feature approved capmaigns
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

        And I visit the admin dashboard as an administrator

    Scenario: Admin fatures a campaign
        Given I click on "Manage campaigns"
        And I click the "Feature" button for the "Veronica Maggio in Stockholm" campaign
        And I wait 3 seconds
