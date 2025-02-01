// // node("JDK-11-MVN") {
// //   stage("get-code") {
// //     sh " git clone https://github.com/spring-projects/spring-petclinic.git && cd spring-petclinic"
// //   }
// //   stage("build") {
// //     sh "mvn package"
// //   }
// // }

// pipeline  {
//   agent any
//   tools{
//     maven 'MAVEN-3.9.9'
//   }
//   stages {
//     stage('Git')  {
//       steps {
//         git url: 'https://github.com/PrachiVpatil96/spring-petclinic.git'
//       }
//     }
//     stage('Get-Version') {
//       steps {
//         sh 'java --version'
//       }
//     }
//     stage ('Build'){
//       steps {
//         sh 'mvn validate'
//         sh 'mvn clean package'
//       }
//     }
//   }

// }

pipeline {
  agent any
  tools {
    maven 'maven-3.9.9'
  }
      triggers {
        cron('H */4 * * 1-5')
    }
  stages {
    stage('Git') {
      steps {
        git url: 'https://github.com/PrachiVpatil96/spring-petclinic.git'
      }
    }
    stage('BUILD') {
      steps {
        withSonarQubeEnv(credentialsId: 'SONARCLOUD_ID', installationName: 'SONARCLOUD') {
          sh '''
            mvn clean package org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar \
            -Dsonar.organization=prachi-sonarqube \
            -Dsonar.projectKey=188cab95e3819d6649c93507d5784b5759bc5815
          '''
        }
        junit testResults: '**/surefire-reports/*.xml', allowEmptyResults: true
        archiveArtifacts artifacts: '**/target/spring-petclinic-*.jar', fingerprint: true
      }
    }
    stage("Quality Gate") { 
            steps { 
                timeout(time: 1, unit: 'HOURS') { 
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails 
                    waitForQualityGate abortPipeline: true 
                } 
            } 
        }
    
  }
}
