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

    stage('Slack') {
      steps {
        slackSend message: 'Pipeline Iniciada'

}
}
  }

    stage('Clone repository') { 
      steps { 
        script{
          checkout scm
          slackSend message: 'Repositorio foi Clonado'
            }
             } 
    }
   ///Qualite gate
    stage('SonarCloud-GateCode-Quality') {
            steps {	
		sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=-TechDay--Jenkins-Servidor-CI-CD -Dsonar.organization=brunosantos881388 -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=fc8f04f3543d8b4d9217a0b20fe72a02521694aa'
    slackSend message: 'Passou qualidade do codigo.'
			}
        } 
    stage('Synk-GateSonar-Security') {
            steps {		
				withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
				sh 'mvn snyk:test -fn'
        slackSend message: 'Passou test segurança.'
				}
			}
  }


///INFRA iS CODE 
    stage('TF INICIAR') {
            steps {
                sh 'terraform init '
                slackSend message: 'inicio terraform'
                
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
          slackSend message: 'Terminou de criar InfraEstrutura'
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
                 slackSend message: 'Tudo Certo, Pipeline foi Aprovada.'

        } 
        failure {
           mail to: 'infratidevops@gmail.com',
                subject:"FAILURE: ${currentBuild.fullDisplayName}",
                body: "Pipeline Falhou , verificar os parametros corretos!"
                slackSend message: 'Não passou, Pipeline foi reprovada, é bom verificar alguns estagio da Pipeline e verificar.'

        }
  }
