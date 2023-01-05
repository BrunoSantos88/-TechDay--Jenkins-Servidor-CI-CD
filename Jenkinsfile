pipeline {
  agent any
  tools { 
        maven 'Maven 3.5.2'  
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

 stage('Logging into AWS ECR') {
            steps {
                script {
                sh """aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 555527584255.dkr.ecr.us-east-1.amazonaws.com"""
                }
                 
            }
        }

   }
   }

