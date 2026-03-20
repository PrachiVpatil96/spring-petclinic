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

        // stage('Quality Gate Check') {
        //     steps {
        //         timeout(time: 2, unit: 'MINUTES') {
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
     // end of stages

    // post {
    //     failure {
    //         echo "🚨 Build failed due to Quality Gate failure or test failures!"
    //     }
    //     success {
    //         echo "✅ Build passed! Code coverage is at least 80%."
    //     }
    // }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t spc:${BUILD_NUMBER} ."
                }
        }
}
}

