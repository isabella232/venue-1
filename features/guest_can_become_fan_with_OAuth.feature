@javascript
Feature: A Guest can become a Fan with OAuth authentication
    As a Guest
    In order to simplify the sign up/sign in process 
    I would like to be able to authenticate myself using Facebook or Google

    Scenario: Guest can authenticate with Facebook
        Given I am on the landing page
        And I click on 'Sign up'
        And I click on 'Sign up with Facebook'
        Then I should be redirected to the landing page 
        And I should see 'Successfully authenticated from Facebook account'

    Scenario: Guest can authenticate with Google
        Given I am on the landing page
        And I click on 'Sign up'
        And I click on 'Sign up with Google'
        Then I should be redirected to the landing page 
        Then I should see 'Successfully authenticated from Google account'