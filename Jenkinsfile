pipeline {
environment {
registry = "brunosantos88/developerpythonapp"
registryCredential = 'dockerlogin'
dockerImage = 'frontend'
}
agent any
stages {
stage('Cloning our Git') {
steps {
git 'https://github.com/BrunoSantos88/-TechDay--Jenkins-Servidor-CI-CD.git'
}
}
stage('Building our image') {
steps{
script {
dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
}
stage('Deploy our image') {
steps{
script {
docker.withRegistry( '', registryCredential ) {
dockerImage.push()
}
}
}
}
}
}