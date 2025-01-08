// node("JDK-11-MVN") {
//   stage("get-code") {
//     sh " git clone https://github.com/spring-projects/spring-petclinic.git && cd spring-petclinic"
//   }
//   stage("build") {
//     sh "mvn package"
//   }
// }

pipeline  {
  agent any
  tools{
    maven 'MAVEN-3.9.9'
  }
  stages {
    stage('Git')  {
      steps {
        git url: 'https://github.com/PrachiVpatil96/spring-petclinic.git'
      }
    }
    stage('Get-Version') {
      steps {
        sh 'java --version'
      }
    }
    stage ('Build'){
      steps {
        sh 'mvn validate'
        sh 'clean package'
      }
    }
  }

}

