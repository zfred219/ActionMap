Feature: User can add and check new article

        As a political activist,
        I want to know news related to one representative
        So that I check the news article 
        
Background: Add mocking representative
    Given the API call is stubbed


Scenario: click on the news article button for a specific representative
    Given I'm on representative list page for Alameda County
    And I press the "News Articles" button for first representative
    Then I should see "Articles"
  
Scenario: after login, should be able to add news article to a representative
    Given I am logged in
    And I'm on representative list page for Alameda County
    And I press the "News Articles" button for first representative
    And I follow "Add News Article"
    Then I should see "Edit news article"
    And I fill in the information for news article
    And I press "Save"
    Then I should see "News item was successfully created."
    And I should see "Fake News"
    Then I follow "View all articles"
    Then I should see "Fake News"
    And I should see "Delete"
  
Scenario: Cannot add news articles without login
    And I'm on representative list page for Alameda County
    And I press the "News Articles" button for first representative
    And I follow "Add News Article"
    Then I am on the login page
    Then I should not see "Edit news article"
    
Scenario: should be able to edit news article to a representative
   Given I am logged in
   And I'm on representative list page for Alameda County
   And There exist one news article for Donald Trump
   And I follow "Edit"
   Then I should see "Edit news article"
   Then I press "Save"
  
  
# Unable to delete rn