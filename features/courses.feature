Feature: The application should provide a simple structure for courses and assignments.

  Scenario: Viewing the list of all courses
    Given I am on the main page
    And there are courses
    Then I should see the list of courses
