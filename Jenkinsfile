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
  stages {
    stage('Git')  {
      steps {
        sh " git clone https://github.com/PrachiVpatil96/spring-petclinic.git"
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
      }
    }
  }

}

