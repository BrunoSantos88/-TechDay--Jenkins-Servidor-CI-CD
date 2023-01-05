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
                    docker.build("app:${TAG}")
                }
            }
        }

        stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerlogin') {
                        docker.image("brunosantos88/developerpythonapp/app:${TAG}").push()
                        docker.image("brunosantos88/developerpythonapp/app:${TAG}").push("latest")

             }
                }
            }
        }
  }
   }