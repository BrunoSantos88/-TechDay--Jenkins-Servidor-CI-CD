pipeline {
environment {
registry = "brunosantos88/developerpythonapp"
registryCredential = 'dockerlogin'
dockerImage = 'frontend'
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
