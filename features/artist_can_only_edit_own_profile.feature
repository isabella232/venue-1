@javascript
Feature: Artist can only edit own Artist profile

    Background: 
        Given the following users exist
        | email          | role   |
        | kanye@venue.se | artist |
        | jay@venue.se   | artist |
        And the following performers exist
        | name       | user             |
        | Kayne West | kanye@venue.se |
        | Jay-Z      | jay@venue.se |
