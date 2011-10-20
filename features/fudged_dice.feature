Feature: Character creation
	In order to randomize outcomes
	Dice need to be fudged

Scenario: Set Fudged Dice
	Given a connection
	When I type "fudge 30"
	Then I should see "Next die roll fudged to 30"

#Picked 101 because it won't be randomized accidentally
Scenario: Roll Fudged Dice
	Given a connection
	When I type "fudge 101"
	And  I type "roll"
	Then I should see "You rolled 101"