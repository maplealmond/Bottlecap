Feature: Skill Checks
	In order to play the game
	Characters need to be able to make skill checks

Scenario: Average Roll
	Given an average character "Joe"
	And "Joe" has 35 points in "Security"
	And the next roll is a 50
	Then "Joe" has an effective skill of 50
	And when "Joe" rolls "Security" he scores "Fair"