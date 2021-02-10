Feature: search for representatives by county

    As a political activist,
    I want to click on a specific county for any state
    So that I can see a list of representatives associated with the county
    
Background: Stubbed API call
    Given the API call is stubbed

Scenario: click on the view button besides each county
    Given I am on the state map page of "CA"
    When I click view button in Alameda County
    Then I should see "Phong La"
    And I should see "Gregory Ahern"
    
Scenario: click on a county on the state map
    Given I am on the state map page of "CA"
    And I press Alameda County on the map
    Then I should see "Phong La"
    And I should see "Gregory Ahern"