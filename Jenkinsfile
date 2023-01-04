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
stage('Build') { 
            steps { 
               withDockerRegistry([credentialsId: "dockerlogin", url: ""]) {
                 script{
                 app =  docker.build("infrati")
                 }
               }
            }
    }
        
stage('Push') {
            steps {
                script{
                    docker.withRegistry('132333066544.dkr.ecr.us-east-1.amazonaws.com', 'ecr:east-1:aws-credentials') {
                    app.push("latest")
                    }
                }
            }
    	}
	    
  }
