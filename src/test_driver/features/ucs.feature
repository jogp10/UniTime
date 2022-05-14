Feature: check UC details
  The UC details should appear when we click on the respective uc options


Scenario: A student wants to check UC's details
  @Given I expect to check my UC's details
  @When I tap the "Calendário" button 1 time
  @When consult a day that has an evaluation moment
  @When I tap the "uc[name]" button 1 time
  @Then The UC's details are presented

Scenario: A student wants to check UC's details
  @Given I expect to check my UC's details
  @When I tap the "Minhas UC's" button 1 time
  @When I tap the "uc[name]" button 1 time which I am enrolled in
  @Then The UC's details are presented