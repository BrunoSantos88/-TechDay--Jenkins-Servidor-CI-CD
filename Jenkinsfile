pipeline {
    agent any
    tools {
       terraform 'Terraform'
    }
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
        stages {
        
        stage('Terraform init') {
            steps {
                sh 'terraform init -reconfigure'
            }
        }
        stage('Apply Network') {
            steps {
          sh 'terraform apply -auto-approve'
            }
        }
    }
}
