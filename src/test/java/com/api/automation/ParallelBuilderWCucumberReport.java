package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilderWCucumberReport {

	@Test
	public void executeKarateTest() {
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation/postrequest");

		Results result = aRunner.parallel(5);
		System.out.println("Total Features -> " + result.getFeaturesTotal());
		System.out.println("Total Scenarios -> " + result.getScenariosTotal());
		System.out.println("Passed Scenarios -> " + result.getScenariosPassed());
		generateCucumberReport(result.getReportDir());

		Assertions.assertEquals(0, result.getFailCount(), "We have failed scenarios :(");
	}

	// le damos como param la ubicación del reporte
	private void generateCucumberReport(String reportDirLocation) {
		File reportDir = new File(reportDirLocation);
		Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] { "json" }, true);

		List<String> jsonFiles = new ArrayList<>();
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));

		// Configuration configuration = new Configuration(reportDir, "Karate Run");
		// ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		// reportBuilder.generateReports();
	}

}
