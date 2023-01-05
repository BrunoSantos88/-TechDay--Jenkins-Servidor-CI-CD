pipeline {
    agent any
    tools {
        maven 'Maven 3.5.2' 
    }

  stage('Build') { 
            steps { 
               withDockerRegistry([credentialsId: "dockerlogin", url: ""]) {
                 script{
                 app =  docker.build("pythonapp")
                 }
               }
            }
    }
}
