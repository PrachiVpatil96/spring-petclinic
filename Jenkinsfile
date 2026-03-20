pipeline {
    agent any

    tools {
        jdk 'jdk-17'
        maven 'maven'
    }

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests -Dcheckstyle.skip=true'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar') {
                    sh "mvn clean verify sonar:sonar -Dsonar.projectKey=spring-pet-clinic"
                }
            }
        }
        stage('Quality Gate Check') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    // Waits for SonarQube Quality Gate result
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        
        
        post {
        failure {
            echo "🚨 Build failed due to Quality Gate failure or test failures!"
        }
        success {
            echo "✅ Build passed! Code coverage is at least 80%."
        }
    }

    // Package the application
        stage('package')
            steps{
                sh 'mvn package'
            }

    } // end of stages
}
//     stages {

//         stage('Checkout') {
//             steps {
//                 git branch: 'main',
//                     url: 'https://github.com/PrachiVpatil96/spring-petclinic.git'
//             }
//         }

//         stage('Build the code') {
//             steps {
//                 sh 'mvn clean package -DskipTests'
//             }
//         }

//         stage('SonarQube Analysis') {
//             steps {
//                 withSonarQubeEnv('SonarQube') {
                
//                     sh 'mvn sonar:sonar -Dsonar.projectKey=spc'
                
//                 }
//             }
//         }
//         stage('Docker Build'){
//             steps{
//                 sh 'docker image buiild -t petclinic:1.0 .'
//             }
//         }
//     }
// }

