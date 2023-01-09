pipeline {
  agent any
  tools { 
        maven 'Maven 3.8.7'  
    }

    environment {
    registry = "brunosantos88/appdogurudevops"
    registryCredential = 'dockerlogin'
    dockerImage = ''
  }

  stages{
 
    stage('Clone repository') { 
      steps { 
        script{
          checkout scm
            }
             } 
    }

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
   }
}
