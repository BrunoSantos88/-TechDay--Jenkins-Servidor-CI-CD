#!groovy
pipeline {
	agent any
  stages {
  	stage('Maven Install') {
    	agent {
      	docker {
        	image 'Maven 3.5.2'
        }
      }
      steps {
      	sh 'mvn clean install'
      }
    }
  }
}