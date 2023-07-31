pipeline {
    agent any

    stages {
        stage('Cleanup Stage') {
            steps {
                bat 'echo Cleanup Stage'
                cleanWs notFailBuild: true
            }
        }
        stage('Git checkout') {
            steps {
                bat 'echo Git checkout'
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jaime-contreras-98/KarateTestRepo.git']])
            }
        }
        stage('Build') {
            steps {
                bat 'echo Build'
                bat 'mvn clean compile'
            }
        }
        stage('Run the test'){
            steps {
                bat 'echo Test execution just started'
                bat 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                bat 'echo Delpoying application'
                bat 'echo Test Execution Completed'
            }
        }
    }
    post {
        always {
            // One or more steps need to be included within each condition's block.
            junit 'target/surefire-reports/*.xml'
            cucumber buildStatus: 'null', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
        }
    }
}
