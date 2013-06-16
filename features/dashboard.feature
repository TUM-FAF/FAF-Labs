Feature: The dashboard is the most important place the students will go to

  Scenario: Getting to the dashboard
    Given I am an existing user
    And I have signed in
    Then I should be on the dashboard
