package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestVariableRunner {

	@Test
	public Karate runTest() {
		return Karate.run("Variables").relativeTo(getClass());
	}

	// @Test
	// public Karate runTestUsingClassPath() {
	// return
	// Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
	// }
}
