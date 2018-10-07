@javascript
Feature: Admin can create a slider from admin dashboard

    As an admin
    In order to always display relevant content to our visitors
    I would like to be able to upload and change pictures in the slider from the admin dashboard

    Background:
        Given I visit the admin dashboard as an administrator

    Scenario: Admin can create a slider
        Given I click on "Manage sliders"
        Then I should see "Sliders"
        When I click on "New Slider"
        And I wait 1 second
        And I fill in 'Title' with 'Band promo 1'
        And I fill in 'Content' with 'The Bands We Love'
        And I select "Visible" in "State"
        And I attach an image to the slider
        And I click on "Create Slider"
        Then there should be a Slider titled 'Band promo 1' in the Database
        And the sliders 'Content' should be 'The Bands We Love'
        And the sliders 'State' should be 'visible'
        And I should see "Your slider has been created"
        And I should see "Band promo 1"

    Scenario: Admin can fail to create a slider
        Given I click on "Manage sliders"
        Then I should see "Sliders"
        When I click on "New Slider"
        And I wait 1 second
        And I fill in 'Title' with ''
        And I fill in 'Content' with ''
        And I select "Visible" in "State"
        And I attach an image to the slider
        And I click on "Create Slider"
        And I should see "Title can't be blank"
        And I should see "Content can't be blank"


