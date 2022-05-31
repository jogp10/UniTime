Feature: Media page
  The pages relative to Média should appear when we click on the respective menu options

  Scenario: Access the "Média" page
    Given I am logged in
    When I open the drawer
    When I tap the "Média" button 1 times
    When I tap the "Desenho de Algoritmos" button 1 times
    Then I expect the text "Exames" to be present