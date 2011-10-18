Feature: Character creation
	In order to play the game
	Characters need to be created and updated

Scenario: Character Creation
	Given a new character "Anna"
	And  "Anna" is level 1
	Then "Anna" should not be complete	
	When "Anna" picks the race "Human"
	And  "Anna" selects starting stats
	And  "Anna" tags the skill "Repair"
	And  "Anna" tags the skill "Firearms"
	And  "Anna" takes the perk "Gun Nut"
	Then "Anna" should have nothing to do
	And  "Anna" should be complete

#The experience points required for level n can be calculated from the equation 25(3n + 2)(n - 1).
Scenario: Adding XP levels a character up
	Given a new character "Bob"
	And  "Bob" is level 1
	When "Bob" gains 200 XP
	Then "Bob" should be level 2
	When "Bob" gains 23600 XP
	Then "Bob" should be level 18