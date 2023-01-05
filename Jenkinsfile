#!groovy
pipeline {
	agent none
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
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t brunosantos88/developerpythonapp:latest .'
      }
    }
  }
}

