pipeline {
environment {
registry = "brunosantos88/developerpythonapp"
registryCredential = 'dockerlogin'
dockerImage = ''
}
agent any
stages {
stage('Cloning our Git') {
steps {
git clone 'https://github.com/BrunoSantos88/-TechDay--Jenkins-Servidor-CI-CD.git'
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
stage('Cleaning up') {
steps{
sh "docker rmi $registry:$BUILD_NUMBER"
}
}
}
}
