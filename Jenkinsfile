pipeline {
agent any

environment {
AWS_ACCOUNT_ID="555527584255"
AWS_DEFAULT_REGION="555527584255.dkr.ecr.us-west-2.amazonaws.com"
IMAGE_REPO_NAME="asg"
IMAGE_TAG="latest"
REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
}

stages {

stage('Cloning Git') {
steps {
checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url:'https://github.com/BrunoSantos88/-TechDay--Jenkins-Servidor-CI-CD.git']]])
}
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
sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
}
}
}
}
