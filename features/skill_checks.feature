Feature: Skill Checks
	In order to play the game
	Characters need to be able to make skill checks

Scenario: Average Roll
	Given an average character "Joe"
	And "Joe" has 35 points in "security"
	And the next roll is a 50
	Then "Joe" has an effective "security" skill of 50
	And when "Joe" tests "security" he scores "fair"
	
Scenario: Fantastic Roll
	Given an average character "Joe"
	And "Joe" has 100 points in "security"
	And the next roll is a 1
	And when "Joe" tests "security" he scores "legendary"
	
Scenario: Terrible Roll
	Given an average character "Joe"
	And "Joe" has 5 points in "security"
	And the next roll is a 100
	And when "Joe" tests "security" he scores "terrible"