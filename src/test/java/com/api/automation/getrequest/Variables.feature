Feature: Variable creation with Karate

	def before_scenario = 10
	
	Background: Create and initialize variables
		* def before_another_scenario = 11
		* def after_another_scenario = "AFTER background"

	Scenario: First variable creation
		Given def var_int = 10
		And def var_string = "This is a string"
		Then print "Int Variable is: ", var_int
		And print "String variable is: ", var_string
		* def before_scenario_total = 10 + var_int
		And print "Total amount is: ", before_scenario_total
		
	Scenario: Second variable creation - access from other scenarios
		Given def var_int = 101
		And def var_string = "This is a string 2"
		When print "Previous var_string: ", var_string
		And print "Previous var_int: " , var_int
		And print "background var: ", before_another_scenario
		And print "background var 2: ", after_another_scenario
