pipeline {
  agent any

  tools { 
        ///depentencias 
        maven 'Maven 3.6.3' 
        terraform 'Terraform 1.3.7' 
    }
        // Chave AWS
        environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

// Stages.
  stages {   

    stage('Slack Notification') {
      steps {
        slackSend message: 'Pipeline Inciada!. Necessidade de atenção, caso seja em Produção!'

}
}

    stage('Clone repository') { 
      steps { 
        script{
          checkout scm
            }
             } 
    }

  stage('Slack Notification(test unit code and vulnerability)') {
    steps {
      slackSend message: 'Pipeline está no Estagio de teste no codigo. O Processo será realiazado emQuality Gate teste de Sonar e Synk, ambos vai verificar bugs e vulnerabilidade em nosso codigo!'

}
}
 
   ///Qualite gate
    stage('SonarCloud-GateCode-Quality') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=-TechDay--Jenkins-Servidor-CI-CD -Dsonar.organization=brunosantos881388 -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=fc8f04f3543d8b4d9217a0b20fe72a02521694aa'
			}
        } 
    stage('Synk-GateSonar-Security') {
            steps {		
				withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
					sh 'mvn snyk:test -fn'
				}
			}
  }

   stage('Slack Notification(Terraform)') {
            steps {
              slackSend message: 'Agora está iniciando processo de construção da infra-estrutura!'
                }
            }


///INFRA iS CODE 
    stage('TF INICIAR') {
            steps {
                sh 'terraform init '
                
            }
        }

        stage('TF Formatar Version') {
            steps {
                sh 'terraform fmt '
                
            }
        }

        stage('TF Appove') {
            steps {
          sh 'terraform apply -auto-approve'
            }
        }
        }


//Notification
      post {
        always {
            echo "Notifying build result by email"
        }
        success {
            mail to: 'infratidevops@gmail.com',
                 subject: "SUCCESS: ${currentBuild.fullDisplayName}",
                 body: "Pipeline passou, Efetou com Sucesso"

        }
        failure {
           mail to: 'infratidevops@gmail.com',
                subject:"FAILURE: ${currentBuild.fullDisplayName}",
                body: "Pipeline Falhou , verificar os parametros corretos!"

        }
      }
  }