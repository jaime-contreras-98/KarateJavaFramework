package com.api.automation;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;

public class ParallelBuilderTags {

	private static final String CLASS_PATH = "classpath:";
	private static final String DELIMITER = ",";

	@Test
	public void executeKarateTest() {
		Builder aRunner = new Builder();
		aRunner.path(getLocation());
		aRunner.tags(getTags());
		// aRunner.tags("@post");
		aRunner.parallel(5);

	}

	/*
	 * public List<String> getTags() { String aTags = System.getProperty("tags",
	 * "@post"); List<String> aTagList = Arrays.asList(aTags);
	 * 
	 * return aTagList; }
	 * 
	 * public List<String> getLocation() { String aLocation =
	 * System.getProperty("location", "com/api/automation"); List<String>
	 * aLocationList = Arrays.asList(CLASS_PATH + aLocation);
	 * 
	 * return aLocationList; }
	 */
	public List<String> getTags() {
		String aTags = System.getProperty("tags", "@post");
		List<String> aTagList = Collections.emptyList();

		if (aTags.contains(DELIMITER)) {
			String tagArray[] = aTags.split(DELIMITER);
			aTagList = Arrays.asList(tagArray);

			return aTagList;
		}

		aTagList = Arrays.asList(aTags);
		return aTagList;
	}

	public List<String> getLocation() {
		String aLocation = System.getProperty("location", "com/api/automation");
		List<String> aLocationList = Collections.emptyList();

		if (aLocation.contains(DELIMITER)) {
			String locationArray[] = aLocation.split(DELIMITER);
			aLocationList = Arrays.asList(locationArray);
			aLocationList.replaceAll((entry) -> {
				return CLASS_PATH + entry;
			});

			return aLocationList;
		}

		aLocationList = Arrays.asList(CLASS_PATH + aLocation);
		return aLocationList;
	}
}