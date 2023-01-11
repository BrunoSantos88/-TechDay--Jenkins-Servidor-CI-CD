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

        stage('TF apply') {
            steps {
          sh 'terraform apply -auto-approve'
            }
        }
        }
  }
