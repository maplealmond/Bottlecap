Feature: Character creation
	In order to play the game
	Characters need to be created and updated

Scenario: Character Creation
	Given a new character "Anna"
	And  "Anna" is level 1
	Then "Anna" should not be complete
	When "Anna" picks the race "Human"
	And  "Anna" tags the skill "Repair"
	And  "Anna" tags the skill "Firearms"
	And  "Anna" takes the perk "Gun Nut"
	Then "Anna" should be complete