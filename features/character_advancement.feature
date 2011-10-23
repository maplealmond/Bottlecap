Feature: Character advancement
	In order to get better at things
	Characters need to advance through practice

#2x relevant stat, 1x luck, Average Joe has all 5s
Scenario: Basic Level
	Given an average character "Joe"
	When "Joe" has not tagged "firearms"
	Then "Joe" has an effective "firearms" skill of 15

#Level cap is (20 + 2*Level)
Scenario: Basic Practice to Level Cap
	Given an average character "Joe"
	When "Joe" has not tagged "firearms"
	And  "Joe" has practiced "firearms" 100 times
	Then "Joe" has an effective "firearms" skill of 37

#Tagging adds +15%
Scenario: Tagged Skill
	Given an average character "Joe"
	When "Joe" has tagged "firearms"
	Then "Joe" has an effective "firearms" skill of 30

#Level 1 cap is 22% + 15% from stats, advancement is 1 use per 1%
Scenario: Tagging Practice to Level Cap
	Given an average character "Joe"
	When "Joe" has tagged "firearms"
	And  "Joe" has practiced "firearms" 10 times
	Then "Joe" has an effective "firearms" skill of 37

