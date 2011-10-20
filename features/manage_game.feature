Feature: Game World Management
	In order to provide an environment for the game
	Architects needs to be able to load and create game worlds

Scenario: Load a non existent game
	Given a connection
	When I type "load game Wasteland"
	Then I should see "Game not found"
	And I should not see "Game has been loaded"

Scenario: Create a game
	Given a connection
	When I type "create game Wasteland"
	Then I should see "Game has been created"
	
Scenario: Load a existent game
	Given a connection
	When I type "create game Wasteland"
	And I type "load game Wasteland"
	Then I should see "Game has been loaded"
	