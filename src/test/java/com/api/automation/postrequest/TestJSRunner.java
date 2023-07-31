package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestJSRunner {

	@Test
	public Karate runTest() {
		return Karate.run("JavascriptExecutor").relativeTo(getClass());
	}

	// @Test
	// public Karate runTestUsingClassPath() {
	// return
	// Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
	// }
}
