package com.api.automation.queryparam;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestQueryParamRunner {

	@Test
	public Karate runTest() {
		return Karate.run("queryParams").relativeTo(getClass());
	}

	// @Test
	// public Karate runTestUsingClassPath() {
	// return
	// Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
	// }
}
