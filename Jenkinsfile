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
                sh 'docker image build -t spc:${BUILD_NUMBER} .'
            }
        }
        stage("Docker & Push") {
                steps {
                    script {
                            // Use Docker Hub credentials stored in Jenkins
                            withCredentials([credentialsId: 'dockerhub', url: "https://index.docker.io/v1/"]) {
                
                            // Tag image with Docker Hub repo and Jenkins build number
                            sh "docker tag spc:${BUILD_NUMBER} prachiii123/flyingduck:${BUILD_NUMBER}"

                            // Push image to Docker Hub
                            sh "docker push prachiii123/flyingduck:${BUILD_NUMBER}"

                            echo " Docker image prachiii123/flyingduck:${BUILD_NUMBER} pushed successfully"
                    }
        }
    }
}
}
}

