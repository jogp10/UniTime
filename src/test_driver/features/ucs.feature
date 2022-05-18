Feature: UC info
  The pages relative to UC's should appear when we click on the respective menu options

  Scenario: Access the "Minhas UC's" page
    Given I am logged in
    When I open the drawer
    When I tap the "Minhas UC's" button 1 times
    When I tap the "Engenharia de Software" button 1 times
    Then I expect the text "Engenharia de Software" to be present