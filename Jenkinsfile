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
stage('Build') { 
            steps { 
               withDockerRegistry([credentialsId: "dockerlogin", url: ""]) {
                 script{
                 app =  docker.build("frontend")
                 }
               }
            }
    }

	stage('Push') {
            steps {
                script{
                    docker.withRegistry('https://555527584255.dkr.ecr.us-east-1.amazonaws.com', 'ecr.us-east-1:aws-credentials') {
                    app.push("latest")
                    }
                }
            }
    	}
	    
  }
}

