Feature: UC info
  The pages relative to UC's should appear when we click on the respective menu options

  Scenario: A student wants to his UC's
    Given The "Minhas UC's" page
    When I tap "$UCname" which I am enrolled in
    Then The "$UCname" details are presented