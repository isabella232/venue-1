Feature: Guests need to register to create campaigns
    As a System Owner
    In order to have control of the Campaigns created
    I would like my Guests to register first

    PT link: https://www.pivotaltracker.com/story/show/160228213

    Scenario: Guest needs to register
        When I am on the landing page
        And I click on 'Sign up'
        And I am redirected to 'Sign up' page
        And I should see 'Sign up with Email address'
        And I fill in 'Email address' field with 'mikael@venue.com'
        And I fill in 'Password' field with 'my-password'
        And I fill in 'Re-Type Password' field with 'my-password'
        And I click on 'Sign up'
        Then I should see 'Welcome! You have signed up successfully.'