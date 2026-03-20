pipeline {
    agent any

    tools {
        jdk 'jdk-17'        
        maven 'maven'
    }

    stages{
        stage('Compile'){
            steps{
                sh 'mvn clean'
            }
        }
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
}