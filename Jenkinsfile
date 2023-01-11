pipeline {
  agent any
  tools { 
        maven 'Maven 3.6.3' 
        terraform 'Terraform 1.3.7' 
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

        stages {
        
    stage('Clone repository') { 
      steps { 
        script{
          checkout scm
            }
             } 
    }

    stage('SonarCloud-GateCode-Quality') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=-TechDay--Jenkins-Servidor-CI-CD -Dsonar.organization=brunosantos881388 -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=ef814cbc7a3bebcd87e212e7638a2bd75e41bb62'
			}
        } 
    stage('Synk-GateSonar-Security') {
            steps {		
				withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
					sh 'mvn snyk:test -fn'
				}
			}
  }

    stage('TF init') {
            steps {
                sh 'terraform init '
                
            }
        }

        stage('TF fmt') {
            steps {
                sh 'terraform fmt '
                
            }
        }

        stage('TF Destroy') {
            steps {
          sh 'terraform destroy -auto-approve'
            }
        }
        }
  }