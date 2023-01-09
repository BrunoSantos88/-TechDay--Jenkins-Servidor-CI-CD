pipeline {
agent any
options {
skipStagesAfterUnstable()
}
stages {
stage('Clone repository') { 
steps { 
script{
checkout scm
}
}
}
stage('Build') { 
steps { 
script{
app = docker.build("frontend")
}
}
}
stage('Test'){
steps {
echo 'Empty'
}
}
stage('Push') {
steps {
script{
docker.withRegistry('https://555527584255.dkr.ecr.us-east-1.amazonaws.com','ecr.us-east-1:AWS_ECR') {
app.push("${env.BUILD_NUMBER}")
app.push("latest")
}
}
}
}
}
}

