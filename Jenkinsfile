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
        stage('Git Clone') {
           steps{
                git branch: 'main', url: 'https://github.com/BrunoSantos88/Jenkins-Terraform-CI-CD--AWS.git'
           }
        }

        stage('Terraform Init') {
            steps {
                sh 'cd -Terraform/networking'
                sh 'terraform init'
                
            }
        }

        stage('Apply') {
            steps {
          sh 'cd -Terraform/networking'      
          sh 'terraform apply -auto-approve'
            }
        }
    }
}