pipeline {
agent any

environment {
AWS_ACCOUNT_ID="555527584255"
AWS_DEFAULT_REGION="555527584255.dkr.ecr.us-west-2.amazonaws.com"
IMAGE_REPO_NAME="asg"
IMAGE_TAG="latest"
REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
}


stage('Building image') {
steps{
script {
dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
}
}
}

}


