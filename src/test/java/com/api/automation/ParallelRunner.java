package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;

public class ParallelRunner {

	@Test
	public void executeKarateTests() {
		// Runner.builder().parallel(5);
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation/postrequest");
		aRunner.parallel(5);

		// Runner.parallel(aRunner);
	}

}
