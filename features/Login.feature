Feature: Login process


	Scenario: User with valid credentials can login
		Given I open a browser
		Then I logn with "marioluigio@mail.com" email and "Marioluigio" password
		Then I should see "Sign out" link
