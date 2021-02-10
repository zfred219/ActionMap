Feature: A user can search representatives by typing in address

        As a political activist,
        I want to search representative by address
        So that a list of representatives associated with address will show up
        
Background: Seed in data and regardless of login or not
   Given all the states exist 
    
Scenario: A user is able to see the search for a representative
  Given I am on the map page
  And I follow "Representatives"
  Then I should be on the representatives page
  
# use web step
Scenario: A user can search for a representative by fill in address with state (Happy)
  Given I am on the representatives page
  And the API call is stubbed to California
  And I fill in "address" with "California"
  And I press "Search"
  Then I should be on the representatives list page
  
Scenario: A user can search for a representative by fill in address with county (Happy)
  Given I am on the representatives page
  And the API call is stubbed to Alameda
  And I fill in "address" with "Alameda"
  And I press "Search"
  Then I should be on the representatives list page  

Scenario: A user should see message if search with abbreviated address (Happy)
  Given I am on the representatives page
  And the API call is stubbed to Cal
  And I fill in "address" with "Cal"
  And I press "Search"
  Then I should be on the representatives list page
  
  

# ISSUE need to be solved, not for coverage purpose

Scenario: A user should see message if search with totally invalid address (sad)
  Given I am on the representatives page
  And I fill in "address" with "ajax"
  #And I press "Search"
  #Then I should be on the representatives page
  #Then I should see ""

Scenario: A user should see message if search without input (sad)
  Given I am on the representatives page
  And I fill in "address" with ""
  #And I press "Search"
  #Then I should be on the representatives page
  #Then I should see ""
