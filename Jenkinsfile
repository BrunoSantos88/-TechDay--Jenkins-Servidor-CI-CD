pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
        }
    }
    
stages {
        stage('Build') {
            steps {
                bat  'docker build -t sampleapp .'
            }
        }
        
stage('Push') {
            steps {
                script{
                    docker.withRegistry('132333066544.dkr.ecr.us-east-1.amazonaws.com/infrati', 'ecr:east-1:aws-credentials') {
                    app.push("latest")
                    }
                }
            }
    	}
	    
  }
}