Feature: Game World Management
	In order to provide an environment for the game
	Architects needs to be able to load and create game worlds

Scenario: Start building a map
	Given a connection
	And I type "create game Wasteland"
	And I type "load game Wasteland"
	And I type "load map Vault 50"
	Then I should not see "Map has been loaded"
	
Scenario: Start building a map
	Given a connection
	And I type "create game Wasteland"
	And I type "load game Wasteland"
	And I type "create map Vault 50"
	And I type "load map Vault 50"
	Then I should not see "Map has been loaded"