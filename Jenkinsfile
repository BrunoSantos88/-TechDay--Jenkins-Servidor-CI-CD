pipeline {
  environment {
    registry = "brunosantos88/testeapp"
    registryCredential = 'dockerlogin'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/BrunoSantos88/-TechDay--Jenkins-Servidor-CI-CD.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}