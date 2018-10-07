@javascript
Feature: Admin can create a slider from admin dashboard

    As an admin
    In order to always display relevant content to our visitors
    I would like to be able to upload and change pictures in the slider from the admin dashboard

    Background:
        Given I visit the admin dashboard as an administrator

    Scenario:
        Given I click on "Manage sliders"
        Then I should see "Sliders (0)"