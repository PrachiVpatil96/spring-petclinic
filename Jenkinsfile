pipeline {
    agent any

    triggers {
    pollSCM('H/5 * * * *')
    }

    tools {
        java 'Java-17'
        maven  'Maven'
    }

    stages {
        stage("Checkout"){
            steps{
                git branch: 'main',
                url: 'https://github.com/spring-projects/spring-petclinic.git'
            }
        }
        stage('Build the code')
            steps{
                sh 'mvn clean package'
            }
}
}