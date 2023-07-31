package com.api.automation.fileUpload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestFileUploadRunner {

	@Test
	public Karate runTest() {
		return Karate.run("FileUpload").relativeTo(getClass());
	}

}
