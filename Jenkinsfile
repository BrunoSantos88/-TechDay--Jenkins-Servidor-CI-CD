pipeline {
    agent any
    tools {
        maven 'Maven 3.5.2' 
    }

    stage('Docker Build') {
            steps {
                script {
                    docker.build("hello-world:${TAG}")
                }
            }
        }
    }
