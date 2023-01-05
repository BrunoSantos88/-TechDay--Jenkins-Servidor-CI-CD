pipeline {
  environment {
    registry = "brunosantos88/testeapp"
    registryCredential = 'dockerlogin'
  }
  agent any
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }