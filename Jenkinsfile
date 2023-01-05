pipeline {
    agent any
    tools { 
        maven 'Maven 3.5.2'  
    }
    
    environment {
        AWS_ACCOUNT_ID="555527584255"
        AWS_DEFAULT_REGION="us-east-1"
        IMAGE_REPO_NAME="siteweb"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "555527584255.dkr.ecr.us-east-1.amazonaws.com/siteweb"
    }
}

      // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
        }
      }
    }

    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{  
         script {
                sh """docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"""
                sh """docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"""
         }
        }
      }

