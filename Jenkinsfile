pipeline {
    agent any
    tools {
        maven 'Maven 3.5.2' 
    }
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    docker.build("hello-world:${TAG} .")
                }
            }
        }
    }
}