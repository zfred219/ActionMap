Feature: Adding a new event

As a political activist,
I want to add a new event
So that I could click on Add New Event button

Background: Background: Seed in event data

Given the following states exist:
  | name          | symbol | fips_code    | is_territory   | lat_min       | lat_max      | long_min    | long_max    | 
  | California    | CA     | 06           | 0              | -124.409591   | -114.131211  | 32.534156   | -114.131211 |
  | Oregon        | OR     | 41           | 0              | -124.566244   | -116.463504  | 41.991794   | -116.463504 |
  | Illinois      | IL     | 17           | 0              | -91.513079    | -87.494756   | 36.970298   | -87.494756  |

  
Scenario: Adding a new event
  Given I am logged in
  When I go to the Events page
  And I go to Add New Event
  Then I should see "New event"
  When I fill in "event_name" with "My Birthday"
  And I fill in "Description:" with "Sufyan's birthday party"
  Then I select "California" from "event[state]" 
  And I press "Save"

