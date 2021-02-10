Feature: User can click on state to see county

        As a political activist,
        I want to check county representative
        So that I could click on certain state on map
        
Background: Seed in data and regardless of login or not
   Given all the states exist 

Scenario: A user is able to click on a valid state
  Given I am on the map page
  Then I click "CA" on state map
  Then I should see "California"
  
Scenario: A user is not able to click on a valid state
  Given I am on the map page
  Then I click "SW" on state map
  Then I should see "'SW' not found."