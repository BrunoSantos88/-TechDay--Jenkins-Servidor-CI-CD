pipeline {
agent any
environment {
AWS_ACCOUNT_ID="555527584255"
AWS_DEFAULT_REGION="us-east-1"
IMAGE_REPO_NAME="asg"
IMAGE_TAG="latest"
REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"

}

stages {

stage('Logging into AWS ECR') {
steps {
script {
sh "aws ecr get-login-password — region ${AWS_DEFAULT_REGION} | docker login — username AWS — password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
}

}
}
}
}
