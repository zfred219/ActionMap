Feature: User is able to login with Google/Github account

        As a political activist who opens the map
        So that  I can do more personal activities
        I want to login with Google or Github account
        
Background: None

Scenario: Not logged-in user should see login button
	Given I am not logged in 
  Then I should see "Login"
  
Scenario: Not logged-in user can login with Google account
	Given I am on the login page
	When I follow "Sign in with Google"
	Then I should be on the map page
  And I should see "Profile"
  
Scenario: Not logged-in user can login with Github account
	Given I am on the login page
	When I follow "Sign in with Github"
	Then I should be on the map page
  And I should see "Profile"
  
Scenario: Not logged-in user can login with Github account
	Given I am not logged in
  And I follow "Login"
	When I follow "Sign in with Github"
	Then I should be on the map page


Scenario: Logged-in user should see profile button
	Given I am logged in 
  Then I should see "Profile"
  
Scenario: Logged-in user should be able to see user profile
	Given I am logged in 
  And I follow "Profile"
  Then I should be on the user profile page
  Then I should see "Your Profile"

Scenario: Logged-in user should be able to log out
	Given I am logged in 
  And I follow "Profile"
  Then I follow "Logout"
  Then I should see "Login"
  
Scenario: There is logging out message after user log out
	Given I am logged in 
  And I follow "Profile"
  Then I follow "Logout"
  Then I should see "You have successfully logged out."