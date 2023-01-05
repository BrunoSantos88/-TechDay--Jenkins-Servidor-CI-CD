pipeline {
  agent any
  tools { 
        maven 'Maven 3.5.2'  
    }

    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }


   stages{
    stage('SonarCloud-GateCode-Quality') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=-TechDay--Jenkins-Servidor-CI-CD -Dsonar.organization=brunosantos88-1 -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=700dcb9a79ba7aa525cdf858e19ccf6ad1e59b98'
			}
        } 

stage('Synk-GateSonar-Security') {
            steps {		
				withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
					sh 'mvn snyk:test -fn'
				}
			}
  }

	stage('Docker Build') {
            steps {
                script {
                    docker.build("frontend:${TAG}")
                }
            }
        }

stage('Pushing Docker Image to Dockerhub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerlogin') {
                        docker.image("brunosantos88/developerpythonapp/frontend:${TAG}").push()
                        docker.image("brunosantos88/developerpythonapp/frontend:${TAG}").push("latest")
                    }
                }
            }
        }
   }
}