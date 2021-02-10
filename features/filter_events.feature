Feature: User can filter events

        As a political activist,
        I want to know events happening in certain state or county,
        So that I filter the events
        
Background: Seed in event data

Given the following states exist:
  | name          | symbol | fips_code    | is_territory   | lat_min       | lat_max      | long_min    | long_max    | 
  | California    | CA     | 06           | 0              | -124.409591   | -114.131211  | 32.534156   | -114.131211 |
  | Oregon        | OR     | 41           | 0              | -124.566244   | -116.463504  | 41.991794   | -116.463504 |
  | Illinois      | IL     | 17           | 0              | -91.513079    | -87.494756   | 36.970298   | -87.494756  |

#And the associated counties exist:

And the following events exist:
  | name                      | description |  start_time  | end_time      | state_symbol | fips_code |
  | Pride Parade              | test        |   2100-01-01 | 2100-01-02    |  CA          |  001        |
  | First Fridays             | test        |   2100-01-01 | 2100-01-02    |  CA          |  001        |
  | BLM                       | test        |   2100-01-01 | 2100-01-02    |  OR          |  051        |
  | Disability Pride Parade   | test        |   2100-01-01 | 2100-01-02    |  IL          |  031        |


Scenario: A user should be able to go to event page and see events
  Given I am on the map page
  And I follow "Events"
  Then I should see "BLM"
  Then I should see "Multnomah County"
  Then I should not see "Trump"
  
  
Scenario: Filter events by state
  Given I am on the events page
  And I filter events with "California" state
  And I should see "Pride Parade"
  #And I should not see "BLM"
  
 
Scenario: Filter events by county
  Given I am on the events page
  #And I filter events with "California" state and "King's County"
 # And I should not see "Pride Parade"
  #And I should not see "BLM"
  
  
Scenario: Filter events by state (no such event)
  Given I am on the events page
  
  
Scenario: Filter events by county (no such event)
  Given I am on the events page
 
 
Scenario: Reset the filter from county should reset radio button
  Given I am on the events page
 
Scenario: Reset the filter from county should be able to see all events
  Given I am on the events page
  
  
  