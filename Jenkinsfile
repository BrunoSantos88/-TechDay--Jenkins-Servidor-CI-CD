pipeline {
  agent any

  tools { 
        ///depentencias 
        maven 'Maven 3.6.3' 
        terraform 'Terraform 1.3.7' 
    }
        environment {
        //aws
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERHUB_CREDENTIALS = credentials('dockerlogin')
    }

//Stages.
  stages {   

   // stage('Slack Notification(Start)') {
    //  steps {
    //    slackSend message: 'Pipeline Inciada!. Necessidade de atenção, caso seja em Produção!'

//}
//}

  
stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/-TechDay--Jenkins-Servidor-CI-CD.git', branch: 'main',
    credentialsId: 'jenkins-server_local'
          }
  }

   stage('Slack Notification(Terraform Start Process)') {
            steps {
              slackSend message: 'Agora está iniciando processo de construção da infra-estrutura da AWS. O commando "terraform fmt" , vai atualizar somente oque foi alterado ou adicionado ao projeto!'
                }
          }





          ///Docker STEPS
   // stage('Docker Build') {
   //   steps {
   //    sh 'docker build -t brunosantos88/awssonarqube Sonarqube/.'
   //   }
   //}

   // stage('Docker Login') {
   //   steps {
   //     sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
   //   }
   // }
   
   // stage('Docker Push') {
   //  steps {
   //    sh 'docker push brunosantos88/awssonarqube:latest'
   //  }
 //  }

//INFRA iS CODE


   stage('TF INICIAR') {
         steps {
           sh 'terraform init -reconfigure'
                
          }
     }

    stage('TF FMT') {
         steps {
              sh 'terraform fmt'
                
          }
       }

      stage('TF destroy') {
           steps {
        sh 'terraform destroy -auto-approve'
           }
    }
        }


//Email Notification
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


