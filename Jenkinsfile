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
                bat  'docker build -t sampleapp -f SampleApp/Dockerfile .'
            }
        }
        stage('Push image') {
         steps {
           withDockerRegistry([url: "132333066544.dkr.ecr.us-east-1.amazonaws.com/infrati",credentialsId: "ecr:us-east-1:aws-credentials"]) {
           bat 'docker push sampleapp:latest'
               }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

}