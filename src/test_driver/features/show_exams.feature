Feature: Show Evaluation Moments
  Scenario: login and access the "Calendário" page
    When I fill the "username" field with "up200802821"
    And  I fill the "password" field with "************"
    And I tap the "loginButton" button
    And I open the drawer
    And I tap the "key_Calendário" button
    Then I expect the text "event" to be present