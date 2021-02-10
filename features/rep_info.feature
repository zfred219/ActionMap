Feature: visit profile page for a representative

  As a registered voter
  So that I can find out more information about a representative
  I want to see that representative's profile information. 
  
Background: stubbed API call for representative infomation
    Given the API call is stubbed
    

    And the following representatives exist:
| name             | title                               | ocdid                             | party            |
| Donald Trump     | President of the United States      | ocd-division/country:us           | Republican Party |
| Mike Pence       | Vice President of the United States | ocd-division/country:us           | Republican Party |

Scenario: Search for a representative
  Given I am on the representatives page
  And the API call is stubbed to California
  When I fill in "address" with "California"
  And I press "Search"
  And I should see "Donald J. Trump"
  And I should see "Mike Pence"
  When I follow "Dianne Feinstein"
  Then I should see "Dianne Feinstein"
  And I should see "Democratic Party"
  And I should see "331 Hart Senate Office Building"
  And I should not see "Mike Pence"
  
Scenario: Search for weird names
  Given I am on the representatives page
  And the API call is stubbed to New York
  When I fill in "address" with "New York"
  And I press "Search"
  Then I should see "Donald J. Trump"
  And I should see "Bill de Blasio"
  When I follow "Donald J. Trump"
  Then I should see "Republican Party"

Scenario: Search for a representative profile from news
  Given I am on the representatives page
  And the API call is stubbed to Florida
  When I fill in "address" with "Florida"
  And I press "Search"
  Then I should see "Donald J. Trump"
  When I follow "Donald J. Trump"
  And I follow "News Articles"
  Then I should see "Articles for Donald J. Trump"
  When I follow "Donald J. Trump"
  Then I should see "Donald J. Trump"
  And I should see "Republican Party"
  And I should see "Washington"
  And I should not see "Listing"
  
Scenario: Bad Address
  Given I am on the representatives page
  And the API call is stubbed to ASVYTSUDGIWBUVWIGCUBW
  When I fill in "address" with "ASVYTSUDGIWBUVWIGCUBW"
  And I press "Search"
  Then I should be on the representatives page
  And I should see "Search for a Representative"
  Given the API call is stubbed to New Yok
  When I fill in "address" with "New Yok"
  And I press "Search"
  Then I should not see "Search for a Representative"
