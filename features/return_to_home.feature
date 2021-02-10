Feature: Return to Home Page 

  As a political activist,
  I want to go back to the home page after browsing some pages
  So that I could go back to root page each time I click on Home or Activemap button
  
Background: None

Scenario: Returning from representatives page using Home
  When I go to the representatives page
  And I follow "Home"
  Then I should see "National Map"

Scenario: Returning from representatives page using Action Map
  When I go to the representatives page
  And I follow "Actionmap"
  Then I should see "National Map"

Scenario: Returning from events page using Action Map
  When I go to the events page
  And I follow "Actionmap"
  Then I should see "National Map"

Scenario: Returning from login page using Action Map
  When I go to the login page
  And I follow "Actionmap"
  Then I should see "National Map"


