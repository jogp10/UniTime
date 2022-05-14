Feature: Open pages
  The pages should appear when we click on the respective menu options

  Scenario: Access the "Calendário" page
    Given I am logged in
    When I open the drawer
    When I tap the "Calendário" button 1 times
    Then I expect the text "2022" to be present

  Scenario: Access the "Minhas UC's" page
    Given I am logged in
    When I open the drawer
    When I tap the "Minhas UC's" button 1 times
    Then I expect the text "Engenharia de Software" to be present

  Scenario: Access the "Área Pessoal" page
    Given I am logged in
    When I open the drawer
    When I tap the "Área Pessoal" button 1 times
    Then I expect the text "Área Pessoal" to be present