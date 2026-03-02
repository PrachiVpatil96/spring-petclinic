pipeline {
    agent any

    tools {
        jdk 'Java-17'        
        maven 'Maven'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/PrachiVpatil96/spring-petclinic.git'
            }
        }

        stage('Build the code') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
    }
}