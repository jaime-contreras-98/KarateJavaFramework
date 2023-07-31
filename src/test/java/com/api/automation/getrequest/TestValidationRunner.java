package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestValidationRunner {

	@Test
	public Karate runTest() {
		return Karate.run("createJobEntryExternalFile").relativeTo(getClass());
	}

	// @Test
	// public Karate runTestUsingClassPath() {
	// return
	// Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
	// }
}
