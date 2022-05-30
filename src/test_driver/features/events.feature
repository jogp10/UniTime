Feature: New Event Page
  The pages relative to New Event should appear when we click on the respective menu options

  Scenario: Access the "New Event" page
    Given I am logged in
    When I open the drawer
    When I tap the "Calendário" button 1 times
    When I tap the floating button
    Then I expect the text "Adicionar Novo Evento" to be present
