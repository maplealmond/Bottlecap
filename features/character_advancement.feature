Feature: Character advancement
	In order to get better at things
	Characters need to advance through practice

#2x relevant stat, 1x luck, Average Joe has all 5s
Scenario: Basic Level
	Given an average character "Joe"
	When "Joe" has not tagged "firearms"
	Then "Joe" has an effective "firearms" skill of 15

#Level cap is (20 + 2*Level)
#Advancement is 5 use per 1%
Scenario: Basic Practice
	Given an average character "Joe"
	When "Joe" has not tagged "firearms"
	And  "Joe" has practiced "firearms" 5 times
	Then "Joe" has an effective "firearms" skill of 16

Scenario: Basic Practice to Level Cap
	Given an average character "Joe"
	When "Joe" has not tagged "firearms"
	And  "Joe" has practiced "firearms" 200 times
	Then "Joe" has an effective "firearms" skill of 37

#Tagging adds 15% and changes the advancement to 1 use per 1%
Scenario: Tagged Practice
	Given an average character "Joe"
	When "Joe" has tagged "firearms"
	Then "Joe" has an effective "firearms" skill of 30
	And  "Joe" has practiced "firearms" 5 times
	Then "Joe" has an effective "firearms" skill of 35

Scenario: Tagging Practice to Level Cap
	Given an average character "Joe"
	When "Joe" has tagged "firearms"
	And  "Joe" has practiced "firearms" 30 times
	Then "Joe" has an effective "firearms" skill of 37

